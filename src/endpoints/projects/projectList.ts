import { D1ListEndpoint } from "chanfana";
import { HandleArgs } from "../../types";
import { ProjectModel } from "./base";

export class ProjectList extends D1ListEndpoint<HandleArgs> {
	_meta = {
		model: ProjectModel,
	};

	schema = {
		tags: ["Projects"],
	};

	searchFields = ["name", "description"];
	defaultOrderBy = "display_order ASC";
}
