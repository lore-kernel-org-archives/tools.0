Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D66D18050
	for <tools@linux.kernel.org>; Thu, 16 Apr 2026 11:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338523; cv=none; b=YX5PlNk+VBM7Hwh3mx5bdbVqh1ADYgBadrK2M2gV3udnT0SNy/x9fmiQyP2yZslJBDmqRoiEyydNnsDnQ2VmpOXvMeR2v87sJcBOGyIkulf78a7261IYz8Kr2KEK0xrMNRjVRt26djvQ9sKYkgnr8hg2Gnmlq/cvOLaC7IHBGI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338523; c=relaxed/simple;
	bh=IcjKEGMjjrjyKYJlouFBzoMfsgbE+z2vxLakV2uPKkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mJK52nEx2LE1tYOAnI6PxSbloCSVNqn/YMUBe93czfv+hJIITfTagphWw84OKjQ/0gVFivEOUx0M3t0YPkzU0ClSnEBfcTAUmkSU0EhCCou7Ri7CG3FlUviftLPhO/Oqrx0oNdwEyFQddqYWoeB/IWBwPeREDjfvjIq5KaL6z8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rLvtLHXi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rLvtLHXi"
Received: by smtp.kernel.org (Postfix)
	id ECD32C2BCB4; Thu, 16 Apr 2026 11:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D9CC2BCAF;
	Thu, 16 Apr 2026 11:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776338522;
	bh=IcjKEGMjjrjyKYJlouFBzoMfsgbE+z2vxLakV2uPKkg=;
	h=From:To:Cc:Subject:Date:From;
	b=rLvtLHXiC0jEkr7MXhZie4yNWsFW16bug9VPxiML36ny9nD/FIe2Zgx3ysW+Wwyqr
	 pgmsAI9LwUVSn9F5q/HrxCQHG00REzUM2lHeKXmI/QSCQV/4MUlOA7Wowh6bpPyhi5
	 k44RZwOywz5yuanD5xfPKbvXWfN8DUb/GqVhy84eRYr7HDvkKld7j5kgq5oz5FXO5g
	 EKF+7oUQXQQGyi6AsyI6fZz/fk6G6DppdoW5ocobUR5MKiFc/oYJBHGimHvPxGaNuT
	 2CnmPTQFNhu+ekZghN6vY5GmR6WRgRnzVCj0nZBk4rl+tPZ37aqb4FbLMI3Uyn7fVr
	 DJ3yi2KOZUHgQ==
From: Mike Rapoport <rppt@kernel.org>
To: Dan Rue <danrue@gmail.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@kernel.org,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH] add sashiko URLs
Date: Thu, 16 Apr 2026 14:21:56 +0300
Message-ID: <20260416112156.1059032-1-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sashiko is gaining traction and it's easy to add its URLs along with
lore ones.

Signed-off-by: Mike Rapoport <rppt@kernel.org>
---
 lorifier.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lorifier.py b/lorifier.py
index be7294b..96529bd 100755
--- a/lorifier.py
+++ b/lorifier.py
@@ -25,6 +25,7 @@ import sys
 from email.utils import mktime_tz, parsedate_tz, formatdate
 
 LORE_MASK = "https://lore.kernel.org/all/%s"
+SASHIKO_MASK = "https://sashiko.dev/#/message/%s"
 
 
 class muttemail:
@@ -65,7 +66,9 @@ class muttemail:
             return
 
         lore_url = LORE_MASK % str(message_id).strip("<>")
+        sashiko_url = SASHIKO_MASK % str(message_id).strip("<>")
         self.message.add_header("X-URI", lore_url)
+        self.message.add_header("X-URI", sashiko_url)
 
 
 if __name__ == "__main__":
-- 
2.51.0

