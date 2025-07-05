Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0D91E571B
	for <tools@linux.kernel.org>; Sat,  5 Jul 2025 15:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751730780; cv=none; b=W8wNIEXT40PoL/yewaS7Qr4Jmip3PtmoAhLF3P4aZwmnErS87/CJ8mDyoBZ0DgKdBkurQrTOBfr17YD6qET4WLYHbphiTt7tMEG4gXseben3aREmYGjRWyg2Nej2mpcqUOVRJwR6bcIZlZhYG6kjskjPYCqL5UdO+5A20lPBPtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751730780; c=relaxed/simple;
	bh=QPTrwyCR5WChLqTuHuCOTSvJVJNkN1+5jrW9ajJJixc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ONmNXhQFF4jh2pj3xbXsvGd4OAuyI/UjVVhIQ7Ua3iRmkD0FH+QxGBM2T2oWntB5aM85Eos06cs/Vj/qrBg2IGjj9A47Fmbg9kitBcIACg/yz0N9dfjxUXbqz0GNoM07E3nm6cgqZf1riPyUESipFQqsFplH0arlkPYVPpN3+rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiRxlxrg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiRxlxrg"
Received: by smtp.kernel.org (Postfix)
	id 53F29C4CEEE; Sat,  5 Jul 2025 15:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D00FC4CEE7;
	Sat,  5 Jul 2025 15:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751730780;
	bh=QPTrwyCR5WChLqTuHuCOTSvJVJNkN1+5jrW9ajJJixc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=BiRxlxrgP3eB/WNVxphyuTR3byz2JpCcMa/uCRuchmN8g0RyRVhEMN9L6ZAFD0M7C
	 ZjoYFivJluGOTJ8bRkfub0WfHUGEDG1VxqY0z5E+IZyPhWpz/5Wl+td5+cdhYCglIR
	 3YWIkwHgI+9ZMsOu18pnmu8WQI4i+LiK3tDszhXI3lH8ZDi+36DW9oHhUuIuC5WQQP
	 jhJut3aFjQhFipF7Dp6/f4atrb4dt+eQnQhxGEFJ22S2rGnJoRdthbY66cDKO88Gof
	 cexaD97Vo4hBUDtGYScYiL2Z04RkIPzRkd2YGhmBgscFbOj9lNRj5sjLTNaW/nlo97
	 C0bOKaZWlVEHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2B4C83030;
	Sat,  5 Jul 2025 15:52:59 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 05 Jul 2025 17:52:50 +0200
Subject: [PATCH b4] git_range_to_patches: add git options to better
 represent renames and copies
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-format-harder-v1-1-55c5342be55c@oldschoolsolutions.biz>
X-B4-Tracking: v=1; b=H4sIAFFKaWgC/x3MQQqAIBBA0avErBNUtKCrRAu1KWeRxhgRSHdPW
 r7F/xUKMmGBqavAeFOhnBpU30GILu0oaG0GLbWVo7Riy3y4S0THK7LAAb13VhsfFLTmZNzo+X8
 zeAPL+37mxBT6YwAAAA==
X-Change-ID: 20250705-format-harder-e6ebba524bc1
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751730778; l=1370;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=gAdssHnCF0Xwb2viD/hFmFPVBFIzEo1trVnupy4j+qs=;
 b=CGk1Kn4svxaYySSCryr5OC+kOkZ91Ox1QtsYvoxvqMEqKv3n2W0zj09G5qYAsoDXYaY4okVuJ
 FswehaJQhZkAOiDauxz+noj2BPWjcFBicl1n8YOUSocNjRsAbLW1TIu
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

As remarked in [1] and [2], add the necessary options to get better and more
terse output.

[1]: https://lore.kernel.org/all/7tejkof2kec7ugpz6xugkjrcpzab27lsjpnkphj3vd3xoc4ly7@x3otjziiehju/
[2]: https://lore.kernel.org/all/369fc807-f05e-4837-b623-b718e47fd840@kernel.org/

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
This is an attempt at mitigating the real-world issue of file renames
in patches due to code restructuring. I have a few of these, and would 
like to keep using b4 for patch management.
---
 src/b4/__init__.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index ff6075e3a95e0df5f8ba3f717b12ae2bbce03432..93cf016bd705584ace4d61c4968be365a25f2502 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3594,6 +3594,10 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
             '--encoding=utf-8',
             '--default-prefix',
             '--find-renames',
+			'-M',
+			'-B',
+			'-C',
+			'--find-copies-harder',
         ]
         smcfg = get_sendemail_config()
         if not get_git_bool(str(smcfg.get('mailmap', 'false'))):

---
base-commit: a9b2aba54be85ea2933c43b8a6d71c1611230b59
change-id: 20250705-format-harder-e6ebba524bc1

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>


