import { HttpModule } from "@nestjs/axios";
import { Module } from "@nestjs/common";
import { TerminusModule } from "@nestjs/terminus";

import { HealthController } from "./health.controller";

@Module({
  controllers: [HealthController],
  imports: [TerminusModule, HttpModule],
})
export class HealthModule {}
