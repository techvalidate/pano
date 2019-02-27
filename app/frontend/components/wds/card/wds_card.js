import application from "../../stimulus_application";
import { definitionsFromContext } from "stimulus/webpack-helpers";
import "./wds_card.sass";

const context = require.context('./', true, /_controller\.js$/);
application.load(definitionsFromContext(context));
