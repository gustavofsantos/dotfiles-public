#!/usr/bin/env -S deno run --allow-env

import { getCPF } from "./utils/get-cpf.ts"

const cpf = await getCPF()

console.log(cpf)
