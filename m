Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C81335BA
	for <tools@linux.kernel.org>; Wed, 10 Jun 2026 00:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781052480; cv=none; b=AGp0HnYiamDFZRMKyw1BNEZKHzTQsKg+j6aysK/bK8FQkW+3hesBE4im1250cU1R2IRzQNc/5CS+h65N6SwDeonkykLtr3HE9846Do8R4WWGXjXv3lNjlA5mZUGHbUGc6Gh4i08gveodEL6nYWLmGLjBJjRYtqlvRAlK0sYa470=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781052480; c=relaxed/simple;
	bh=0W7m5dqeM3B0vLopOs4ehQ7HY3LG3eW/tCdGRqyHt10=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=P0lTRq8kXzUV5EH0vX63U+Oz7yXAyELz4SPaV3Cwgao7mRD8CiMEoEkP2YUuF8tVuTipXWmEgoKg+W6qVWbYwuCdccqbkDSkEDWQhDxFj5dbz+uyLvhKBOBpzuM+GlkJBhTEa9sVgO2t1t1dblslVXJWItZw7oclAMtaF0U1IXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=B4a95tU/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="B4a95tU/"
Received: by smtp.kernel.org (Postfix)
	id 11FEC1F00898; Wed, 10 Jun 2026 00:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF0D11F00893;
	Wed, 10 Jun 2026 00:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781052479;
	bh=yXEhv/cgLt306wlsXr9l6grqKkhaxrwPjfBpGqaE9jo=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=B4a95tU/EZ5urGa50PusGm6T2T9UxOlL0QwVwT64O7h62KjkCnyDygySfE7Z2oL59
	 RiD3ze6YkDmz/GCpvkMcSYwjvP5IuOFC0qxPuZDtuoIZRoGQ5c0r3pxo4hAaWEwCYz
	 0olQx02jF5lJHns8xh6PD9AN972/zJFaaR8hhK6s=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20260513-jk-dont-interpret-branch-as-filename-v1-1-220e7b8b006d@intel.com>
References: <20260513-jk-dont-interpret-branch-as-filename-v1-1-220e7b8b006d@intel.com>
Subject: Re: [PATCH b4] Prevent interpreting usebranch as a path in
 find_cover_commit
Message-Id: <178105247054.120849.915073760812820686.b4-ty@b4>
Date: Wed, 10 Jun 2026 00:47:50 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=346;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=Mdgu5LzFQ3jH/IVeOSVrB0TWnIvOGozdqw0SzlKt7NE=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLI0ttjdPX71d6G7s+k9z6qFXk3zap6svrQ8zPfrnmXhe
 0Jf6ZdHdpSyMIhxMciKKbKU7YvdFFT40EMuvccUZg4rE8gQBi5OAZjIo8WMDEvYVuvuOXFUj+vR
 38WHNspt/Tlx6Z8wg7JFbAmtAln6p9wY/lklH1nO+zJl/pPkslOsjbqhvwtLJ129HbxXvuuZYky
 pOQcA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Wed, 13 May 2026 14:30:25 -0700, Jacob Keller wrote:
> Prevent interpreting usebranch as a path in find_cover_commit

Applied, thanks!

[1/1] Prevent interpreting usebranch as a path in find_cover_commit
      commit: 546b02489abf7bfe19d3ad6381692b544dd95535

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

