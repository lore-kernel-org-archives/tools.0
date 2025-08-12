Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5D22FE56E
	for <tools@linux.kernel.org>; Tue, 12 Aug 2025 17:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755021561; cv=none; b=lDcWzAUNgXd0shVWHK9pGcKvLsxFArvcTvoqiFznVw3hEq1M4IREgsNd4Lmw3qsEquEFd7ous1iSdkJCThOKEQmj4fTyhpiuXgIHvw16rRDxDkDtExJ3Nx6BH9Paf5l3ZrXk2E0bkFuSi4pCQ3jataYyEI0kXqXczdaggEbwoYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755021561; c=relaxed/simple;
	bh=nlIO//jZ2weZx34dLPui/msR2DyB4Z4hVhnWq8BNy2c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nLvB+qP3FAaRDJR843Vyr06JxMOB1lRTKRSNbaItVBEufm/W30jAM6g6i7nUqhsb8sExPAJbSbjc/kxjjbWrny5rhClZAuKzo2uIkEAZ6lnRI8NKpHAg1oDVOjPq24dHC8F0LVfXR+vIyFA1Bf8TjDtVcnYf+QcFpxIUSIpIyYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FPyekaKy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FPyekaKy"
Received: by smtp.kernel.org (Postfix)
	id 32626C4CEF6; Tue, 12 Aug 2025 17:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 149EEC4CEF1;
	Tue, 12 Aug 2025 17:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755021561;
	bh=nlIO//jZ2weZx34dLPui/msR2DyB4Z4hVhnWq8BNy2c=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FPyekaKyM20fMoFKWQoHQreF+m04T0AEvNyL68Rhl1SMhUodRahvRTBpsoofTcEA2
	 LfgcEmyTWPu9SxUWjPLWg2zJYHMRbX6vRMAyd7wRNCX7oknFF34ojDQmmc6chL/6D3
	 Y0QTkKr2Tl+jgJolVcoLEvGE6Gg8MojIKQCTOIgJbEozqdOy/LjbLR0WgLbumGD51W
	 AVeOmZ7q21LOpWB68niRjx9V1y1J1mycMrA9tsXbBnc/7hzsgZyoTeyfkW8F/bsNUY
	 DlzObsnnabTyqOr68fMWeDPKvPAEmRrKIj4dntjHimCm19ewOfLfISxiQPTie+sh4d
	 AiWSgnk0m/43w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7ACDCA0EDB;
	Tue, 12 Aug 2025 17:59:20 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH b4 v2 0/2] git_range_to_patches: add git options to better
 represent renames and copies
Date: Tue, 12 Aug 2025 19:59:13 +0200
Message-Id: <20250812-format-harder-v2-0-53f74982079a@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPGAm2gC/3VOSw6CMBC9Cpm1NbRSTVx5D8KiLYOdBBkzg0Ql3
 N2Gvbv3yfusoCiECtdqBcGFlHgqxB0qSDlMdzTUFw6udr6+1N4MLI8wmxykRzF4xhiDd01MFkr
 mKTjQe+9rITbQFS2TziyffWKxu/OnbbHGGu+TPzUuYgE3HntNmXlUHl9z+abHSF/otm37AXk3V
 H+7AAAA
X-Change-ID: 20250705-format-harder-e6ebba524bc1
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755021559; l=871;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=nlIO//jZ2weZx34dLPui/msR2DyB4Z4hVhnWq8BNy2c=;
 b=M6OGwdU7cWsVhgjcKXxzv5uWlOsDWC1waPbjWwe8PlY6WvAAtN9U85AfI2NnMCmR5vDEFxGnA
 3rPFm3shmC+Ck3lPU7t0ultee4Bt9uvc6ZRRisrZxWD5UXwU68AqK+b
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

This is an attempt at mitigating the real-world issue of file renames
in patches due to code restructuring. I have a few of these, and would 
like to keep using b4 for patch management.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
Changes in v2:
- set minimum similarity index to 95% to avoid un-reviewable patches
- Link to v1: https://patch.msgid.link/20250705-format-harder-v1-1-55c5342be55c@oldschoolsolutions.biz

---
Jens Glathe (2):
      git_range_to_patches: add git options to better represent renames and copies
      git_range_to_patches: set minimum similarity index to 95%

 src/b4/__init__.py | 4 ++++
 1 file changed, 4 insertions(+)
---
base-commit: a9b2aba54be85ea2933c43b8a6d71c1611230b59
change-id: 20250705-format-harder-e6ebba524bc1

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>


