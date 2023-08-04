#!/usr/bin/env zx

import {
  getNamespace,
  getRegions,
  getTenancyId,
  searchCompartmentIdByName,
} from "./lib/oci.mjs";
import { setVariableFromEnvOrPrompt, exitWithError } from "./lib/utils.mjs";
import Mustache from "mustache";

const shell = process.env.SHELL | "/bin/zsh";
$.shell = shell;
$.verbose = false;

const tenancyId = await getTenancyId();

const regions = await getRegions();
const regionName = await setVariableFromEnvOrPrompt(
  "OCI_REGION",
  "OCI Region name",
  async () => printRegionNames(regions)
);

const compartmentName = await setVariableFromEnvOrPrompt(
  "COMPARTMENT_NAME",
  "Compartment Name (root)"
);

const compartmentId = await searchCompartmentIdByName(
  compartmentName || "root"
);

const tfvarsTemplate = await fs.readFile(
  "terraform/terraform.tfvars.mustache",
  "utf-8"
);
const output = Mustache.render(tfvarsTemplate, {
  tenancyId,
  regionName,
  compartmentId,
});

await fs.writeFile("terraform/terraform.tfvars", output);
