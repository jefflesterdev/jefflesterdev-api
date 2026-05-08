import { D1ListEndpoint } from "chanfana";
import { HandleArgs } from "../../types";
import { AchievementModel } from "./base";

export class AchievementList extends D1ListEndpoint<HandleArgs> {
	_meta = {
		model: AchievementModel,
	};

	schema = {
		tags: ["Achievements"],
	};

	defaultOrderBy = "display_order ASC";
}
