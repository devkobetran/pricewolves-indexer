package com.pricewolves_indexer

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class PricewolvesIndexerApplication

fun main(args: Array<String>) {
	runApplication<PricewolvesIndexerApplication>(*args)
}
