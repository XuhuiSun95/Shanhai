#ifndef SHANHAI_CORE_APPLICATION_HPP_
#define SHANHAI_CORE_APPLICATION_HPP_

#include <string>

namespace shanhai::core {

class Application {
 public:
  explicit Application(std::string title);

 private:
  std::string title_;
};

}  // namespace shanhai::core

#endif  // SHANHAI_CORE_APPLICATION_HPP_
