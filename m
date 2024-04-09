Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB49C5339A
	for <tools@linux.kernel.org>; Tue,  9 Apr 2024 09:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712654259; cv=none; b=hSB6op+YXDuuMubIj3DY21Ul4WYUYHoUmmdS8lQjd04fI0ppDmrowFS6MACB+t9XOQahR/kaI/xhAhkf1JVahSvoz1HcB233MgCI0YebpGas0L6IiB4QcPKHWuqcwbxoe0vVYkJLt29DwUDJNxpNx6IQ7qP9h4dp3JAWJg/KKik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712654259; c=relaxed/simple;
	bh=L4Ct6/fE1YWCkFmAAXmRbyITq51PToKtvdsNgI6xQdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XjfsI84kKCV/yjKWSJlW0MPnD0ogeSA/WQa3eWhbWmtciVZYMHTEQccd8itbcau3Q8Nbk7EGHnpcjfpYeYOTF1m/powrET+XESTT8XUvAveeMViIplCHTz5ZKMYFf/gGQqCkG9mv0rYZ34Y6XdHQ4p6BmvfEPOQqFWilZLsf184=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bf0aY00I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bf0aY00I"
Received: by smtp.kernel.org (Postfix)
	id 8429EC433C7; Tue,  9 Apr 2024 09:17:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 62E74C43390
	for <tools@kernel.org>; Tue,  9 Apr 2024 09:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 62E74C43390
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73EEC20007;
	Tue,  9 Apr 2024 09:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712654248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ccaUwG9WnzhNOg4/XxPaIXi0+oUTCyrEiFGe4q+5ynY=;
	b=bf0aY00IbSjjZxGiTxKLflzMyOulzDm5EgfL2VakWeiWxHbUxvcHEQtIsDnBZvdKca+1Co
	zwz4QRCICSPHvr0kq/HLcazgDYctuPfLSWLl3ph4t3MNFnMIbzAKhSQuFg+YEgZGjobauq
	QykTbsbaXKKOKf/fFM64Puhxz7JzKqDUAZeDCYjGJEZWDXMhPzePi63DQg5swsl3VS3U+N
	YmwzExvO8JrdIs3wdvhQBhdEkSM2rwReBXQg/KFyq1OUw7eaSGYcu9OBG+JfVvbsu6kaXi
	YSgseZ7TQL1Uh4oqfOBvCt0176+W6hd2uGa4dqepXHPo4ApbH5fJm4Mp7hZ01w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Apr 2024 11:15:56 +0200
Subject: [PATCH b4] ez: Add a check before returning a commit
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-check_if_branch_exists-v1-1-136504ad81c2@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAEsHFWYC/x3M0QqEIBBA0V+JeV5hKqnYX4lFUsccAjecCCH69
 6TH83DvBUKZSeDbXJDpZOF/qmg/Dbi4pJUU+2rosNOocVIuktsMB2Pzklw0VFgOUcGGfrAtjh4
 91HjPFLi84xmsht99P4MrlY5sAAAA
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=L4Ct6/fE1YWCkFmAAXmRbyITq51PToKtvdsNgI6xQdg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmFQeonX5jfU49HTO/KEh9j5KcG8qFgMFpa40fhwgW
 8nHxvvKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZhUHqAAKCRAgrS7GWxAs4qMxD/
 4wSJ/ErJpvrEomV6E7I3oVsaiiP0mDjVIAlDz4nCWAdllDYiFCx3mFZV7hFYGODzNC3PRbfeWE+IDv
 04vS3wljoziyvHNY3rRjBS4WcNQR1Oy+4gtxioMlt3nu/hk85VQelu54denSxWQPk2CBTpLqKR//Zx
 GYqG42igJgJ2FkJJrT7Xs5GGo+Ufqd7KmKtgxTD4uSuWD89DZUhVEgY6rmoxsLovjOc7qHY43v1gnM
 WlW3bJ4Bubm3pQHqPI6n1UpTO4W1+jHXUIaabP59+Wt5/EJK/SNIG6O4GvT4qVOxdnMKAC0zEyMCsK
 wpozo15BnggR4VJaKZnneBK7w/Wes0aPc1b7O5RRBxBN6+nVwUw6sMduaeVt2UUGImkVm/gzCVjFLe
 oPiBgeWS3GW2WR7t/2Vf8CbOfXJrlKTZgdypVPpQxzv9dz3wdFDXTfRO70og5TTbV/4jKxhV0CKdZJ
 1z/IEiqg5Qe0Fj8xw1JsBfsEp8nssftVO1BE5G7ntVv17imVzU3HaU0FYlHFVxQuf7cWIJmDcU+GQA
 5mvAODQjB9Ipgu48Wfvi9GwdF1wCBKjFWm1MegIFCP+7z3cpPVlGk9EiENfqhn+yVXUewHQjmC2ZW4
 kxmrUNWMAiSy/PSlyHj0239NCN4LYbBC9SUhMdLwxvvIdIj0XRvdQ80oBkoA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com

B4 prep utility only works when a branch is checked out. To avoid
misterious errors at runtime, add a check and a runtime error with an
explicit message when the current branch can't be found.

Cc: thomas.petazzoni@bootlin.com
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 src/b4/ez.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index eeea0203fea5..a2ed1aa14285 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -732,6 +732,10 @@ def find_cover_commit(usebranch: Optional[str] = None) -> Optional[str]:
     logger.debug('Looking for the cover letter commit with magic marker "%s"', MAGIC_MARKER)
     if not usebranch:
         usebranch = b4.git_get_current_branch()
+    if usebranch is None:
+        logger.critical("The current repository is not tracking a branch. To use b4, please checkout a branch.")
+        logger.critical("Maybe a rebase is running?")
+        raise RuntimeError("Not currently on a branch, please checkout a b4-tracked branch")
     gitargs = ['log', '--grep', MAGIC_MARKER, '-F', '--pretty=oneline', '--max-count=1', '--since=1.year',
                usebranch]
     lines = b4.git_get_command_lines(None, gitargs)

---
base-commit: cfcbbe6f23943166f11687ecf37252dc20728639
change-id: 20240408-check_if_branch_exists-fbf36b107d0d

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

