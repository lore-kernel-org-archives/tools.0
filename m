Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C98739B484
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 13:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125485; cv=none; b=AaWkEl/fHkcXy9NO3QiFKYH492/u5T065g2VfUWrLm3/eTNMifKgi8sH3c/pjTyYXzF3+QHuXUQORVdBjYdtPgwW+pCEZgE7D2fgwirChgaqXVY1EcA517HEEwfyuKKilx6BuZwYYX1euriF/GPzHUQxV5RtNtZlGZMzjzIsfLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125485; c=relaxed/simple;
	bh=XsaLztjRLTfh4DG6crmNn3lTxvWR7TD/9Oq52d39XZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m7IcOtqZgFknwxXiCp6XtqGr/yO4O5uQ40Fu+VBMyhE5YDUZ9ujybZejRr4Rq+Qfm8I+CNg8cP30BHnHA3ZfdpVuM/4vQJxtV7+F6HY7BUfsOXAtckz3eVq3DARh0OfK9kLXQV39Jiwa7dxJIqK0QR8jBrOE83bcNHUfBQA1XuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 3242BC2BC9E; Tue,  3 Feb 2026 13:31:25 +0000 (UTC)
Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50186C19425
	for <tools@kernel.org>; Tue,  3 Feb 2026 13:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 50186C19425
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f54BS0vNLzl5X;
	Tue,  3 Feb 2026 14:31:12 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f54BR4ncRz791;
	Tue,  3 Feb 2026 14:31:11 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 03 Feb 2026 14:31:00 +0100
Subject: [PATCH b4 01/21] docs: maintainer: ty: fix incorrect config name
 for templates
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-misc-docs-v1-1-fddb72511357@cherry.de>
References: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
In-Reply-To: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-cb172
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The config options are named with dashes and not underscores, so let's
fix that oversight.

Fixes: 2ce1e619ddb4 ("docs: complete most of the maintainer docs")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 docs/maintainer/ty.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/maintainer/ty.rst b/docs/maintainer/ty.rst
index fd69c7e..b445bb6 100644
--- a/docs/maintainer/ty.rst
+++ b/docs/maintainer/ty.rst
@@ -74,7 +74,7 @@ Editing the templates
 You can edit the default templates that are provided with b4 to
 customize the thank-you message. Once you have your own versions, you
 can specify the path to the template to use via the
-``b4.thanks_am_template`` and ``b4.thanks_pr_template`` configuration
+``b4.thanks-am-template`` and ``b4.thanks-pr-template`` configuration
 parameters. See :ref:`ty_settings` for details.
 
 Optional flags

-- 
2.52.0

