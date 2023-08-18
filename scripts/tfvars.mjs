#!/usr/bin/env zx

import { getOutputValues } from "./lib/terraform.mjs";
import Mustache from "mustache";
import { readEnvJson } from "./lib/utils.mjs";

const shell = process.env.SHELL | "/bin/zsh";
$.shell = shell;
$.verbose = false;

const { _ } = argv;
const [action] = _;

const {
  compartmentId,
  compartmentName,
  regionName,
  tenancyId,
  publicKeyContent,
} = await readEnvJson();

if (action === "env") {
  await envTfvars();
  process.exit(0);
}

if (action === "db") {
  await dbTFvars();
  process.exit(0);
}

console.log("Usage:");
console.log("\tnpx zx scripts/tfvars.mjs env");
console.log("\tnpx zx scripts/tfvars.mjs db");

process.exit(0);

async function envTfvars() {
  const tfVarsPath = "terraform/env/terraform.tfvars";

  const tfvarsTemplate = await fs.readFile(`${tfVarsPath}.mustache`, "utf-8");

  const output = Mustache.render(tfvarsTemplate, {
    tenancyId,
    regionName,
    compartmentId,
  });

  console.log(
    `Terraform will deploy resources in ${chalk.yellow(
      regionName
    )} in compartment ${
      compartmentName ? chalk.yellow(compartmentName) : chalk.yellow("root")
    }`
  );

  await fs.writeFile(tfVarsPath, output);

  console.log(`File ${chalk.yellow(tfVarsPath)} created`);
}

async function dbTFvars() {
  const tfOutput = await getOutputValues("./terraform/env");

  const tfVarsPath = "terraform/db/terraform.tfvars";

  const tfvarsTemplate = await fs.readFile(`${tfVarsPath}.mustache`, "utf-8");

  const output = Mustache.render(tfvarsTemplate, {
    tenancyId,
    regionName,
    compartmentId,
    ssh_public_key: publicKeyContent,
    deploy_id: tfOutput.deploy_id,
    vault_id: tfOutput.vault_id,
    master_key_id: tfOutput.master_key_id,
    privatesubnet_id: tfOutput.privatesubnet_id,
  });

  console.log(
    `Terraform will deploy resources in ${chalk.yellow(
      regionName
    )} in compartment ${
      compartmentName ? chalk.yellow(compartmentName) : chalk.yellow("root")
    }`
  );

  await fs.writeFile(tfVarsPath, output);

  console.log(`File ${chalk.yellow(tfVarsPath)} created`);
}
