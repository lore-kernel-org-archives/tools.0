Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF63E142910
	for <tools@linux.kernel.org>; Tue, 21 May 2024 14:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716302517; cv=none; b=S3TsZwe3a4tB4FPNJ8XqtjQXPcw5ooHzCq70D1HeZh0sZgKDRTwhx7d6AwNcAelhK4GBy9xPMaaGIcRSeWoU/twoI/Tp94w5IntMT8DhkcJ7z81iYnH7psjx/aTJs0LCx3phfTS1XcRoCWGyNe3kWAoJuy0vkfvUzpnVyrKFWTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716302517; c=relaxed/simple;
	bh=qsKFRqBjx6ft4ibBo/9LHXyajqllcAjvkLKP/1NVp5I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qgBJAJVlyTF24O48sFlRUsOnJPebgEDjMnccfB/cfdYwKM6IP2suHOxjErMnzFabP6niF8mWJlXKnkmwAXOzzad29c064dS8iJMZ5tZaRtVxGvzWKpVztVjuDqgMjWKDPG3kx6lR2TImLKygVRTmGKR4tH0L0ZaaPEGTRQ4+RnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KMU81lqL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KMU81lqL"
Received: by smtp.kernel.org (Postfix)
	id E30C1C32786; Tue, 21 May 2024 14:41:56 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 063F4C2BD11
	for <tools@kernel.org>; Tue, 21 May 2024 14:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 063F4C2BD11
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 182081C0009;
	Tue, 21 May 2024 14:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716302513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AvKfAUI+D5FK/F6QK9bNTE9zrpS03QceCLVgTxYoo50=;
	b=KMU81lqLgn9wgnUQmtpb+9sWoI+c9Qu0QbBIC5pEMmFr23WwB8j4JXhPHbVXuX2/KMji32
	WEMcwd17Q3Wpz6ohsdbRa+hqo8H6xVcb2iS+/ZJIB6Zs1ggawhLLl9qJOoV1sCk1vjDOKj
	9OmS2zB2GIX8pFGaGw/QfM2gGk5yaVtrmhL+RGEKbkUyPhAb7/JN8u8XzbWKW6/R0aL24w
	rM3Or2YVth1fEQfZqa7c+ygTdolJ01yPS/G8QiQew+wNtZonbpFCY7jKcI/Y0B0ZUW6gbs
	6X1JMgYv2WP6nhFfPeZERf3hEkHc8/CH7BabbwQv5uC2pWOC3jGLarGhUexs2Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH b4 0/2] get_info and check_deps fixes
Date: Tue, 21 May 2024 16:41:36 +0200
Message-Id: <20240521-fix-check-deps-v1-0-d149bf40e7ee@bootlin.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKCyTGYC/x2MQQqAIBAAvxJ7bkHFiPpKdEh3yyUwUYhA+nvSc
 WBmKhTOwgXmrkLmW4pcsYHuO/BhiwejUGMwylg1GIW7POgD+xOJU8FBj460tbTtE7QoZW7GP1z
 AWVjf9wOnjqY8ZAAAAA==
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=qsKFRqBjx6ft4ibBo/9LHXyajqllcAjvkLKP/1NVp5I=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmTLKwq/lOkM4OmgOKjefCRinoY4QiaReVX0QNn
 7KrS2vovRuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkyysAAKCRAgrS7GWxAs
 4qFND/9/UZbrUC+wRMT7CynVCr+0paV7ae0yqadrcwN6a7SpJW/vPbuaPzOgF59J1IgEUcViUna
 ZTelAJSJnNd94mxpuJEfHQ44YEbA5YBHUWrT4kt8O98VAxtwDAA0a61+d5cq0zGOE/ysWbCtavI
 +QuNHS8L3nUJfYUlv4PHHyhnDmqYUV599z4mpJa4HTA4U8UNyE+Bhc3gfSOasGNA/X3Ol7m0hXS
 b0LQ7fnStOA5gFLSeVRvzPx4PbaE9kqZis8649O+vNp1hzZsGbwXsGmO9Sol0tXzfaW8ca8L9Be
 dmSOyJCzU+aQvGeC+oxXhXo1tVhJmeIAZeDJLb1sZCLAroRlowiexIWE/d73uJ1UhWuw11nC+qh
 +hn6ifSC6R4Byzgin5s6XXMePjNNociWQ4OiRYHaUYIEkeTMk+qVzpi1o2zULVJMTRVyIogR6rV
 uAK3isltdCWsvq4ajEJYU6q3yYpUppFj3ayUuKG0sPDunvuB0JunkctBBBpQJT9eBnztgK5ylKE
 9zM28QWRatCv6HcRoZoV40J5JFkqlw3zSN9ubPPm6NPzgZn9k6R/ce/RksWlYJNXJL1ku65UduF
 IHu+34DgLC8bTsSa6TSPG/z+ZKqVRfbXcM5LQNGFWuwtTUjR+RpjvlLXbUaRsDlmozRMiVBX8G2
 JO8rw8MQm+LgIDw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com

The dictionary returned by get_info() does not contain all the keys (for
example, "needs-checking" is only defined if there are some check commands
AND b4 prep --check was executed). Instead of adding to the complexity of
this function, I rewrote it using literal dictionary declaration, making
it impossible to miss a member and easier to read.

The second issue is with check-deps, when using the cover-letter strategy,
as the cover letter is an empty commit, the git am command was failing. I
simply skipped this empty commit to avoid errors in git am.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Louis Chauvet (2):
      ez: Ensure that all the info dict keys are defined
      ez: Fix check-deps when strategy is commit

 src/b4/ez.py | 82 +++++++++++++++++++++++++++++-------------------------------
 1 file changed, 39 insertions(+), 43 deletions(-)
---
base-commit: f3d47b4f92dfbd09106b06ade5020458a339d960
change-id: 20240520-fix-check-deps-517bd144daf9

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

