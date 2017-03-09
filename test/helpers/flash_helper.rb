# -*- coding: utf-8 -*-
module FlashHelper
  def assert_flash(message, type:)
    assert_equal "× #{message}", find(".alert-#{type}").text
  end
end
