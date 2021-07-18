#include "shanhai/core/application.hpp"

#include <spdlog/spdlog.h>

namespace shanhai::core {

Application::Application(std::string title) : title_{std::move(title)} {
  spdlog::info("Init application");
}

}  // namespace shanhai::core
