import { contentJson, OpenAPIRoute } from "chanfana";
import { z } from "zod";
import { AppContext } from "../../types";
import { skillGroup } from "./base";

type RawSkillGroup = { id: number; name: string; display_order: number };
type RawSkill = { id: number; skill_group_id: number; name: string; proficiency: string | null; display_order: number };

export class SkillList extends OpenAPIRoute {
	schema = {
		tags: ["Skills"],
		summary: "Get all skill groups with their skills",
		responses: {
			"200": {
				description: "Returns skill groups with nested skills",
				...contentJson({
					success: z.boolean(),
					result: z.array(skillGroup),
				}),
			},
		},
	};

	async handle(c: AppContext) {
		const db = c.env.DB;

		const [groupsResult, skillsResult] = await db.batch([
			db.prepare("SELECT * FROM skill_groups ORDER BY display_order ASC"),
			db.prepare("SELECT * FROM skills ORDER BY display_order ASC"),
		]);

		const groups = groupsResult.results as RawSkillGroup[];
		const skills = skillsResult.results as RawSkill[];

		return {
			success: true,
			result: groups.map(group => ({
				...group,
				skills: skills.filter(s => s.skill_group_id === group.id),
			})),
		};
	}
}
