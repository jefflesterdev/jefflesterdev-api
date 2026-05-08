import { D1ReadEndpoint } from "chanfana";
import { HandleArgs } from "../../types";
import { ProjectModel } from "./base";

export class ProjectRead extends D1ReadEndpoint<HandleArgs> {
	_meta = {
		model: ProjectModel,
	};

	schema = {
		tags: ["Projects"],
	};
}
