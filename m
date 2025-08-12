Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01202FE56E
	for <tools@linux.kernel.org>; Tue, 12 Aug 2025 17:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755021561; cv=none; b=bWzvIi6h4WlJ4RzuDilL0ta3i+9HYDEIqcRHxMfDfhxSZeGx4bTr60ZRn8MjQ1zD0/QxuQX8TR5p3Pne0umx/9TNo1jZvu8jJ5Shh2wMnswrz+CzaS+cnyaQ8T175FLo61VqPVmGmsgOtIHQZi0UTD0q2ZgR4jDADuklLlVUaoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755021561; c=relaxed/simple;
	bh=aoldne6qc5eX96kQefAJscUuf3bIWRMcyRa6pd4faY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=moHOBYDmj28/Db0ZXhlk3BLHmDIFco+R82YtpzcaiRUZ1mtOpe6HnOjeBtcSiWxXxlYNoes1ar0+0XM2VZznCG+fQD0Wxf5A2kj2xkuIDCJgppPXJ7ilRjCKKfJV3ZkVADpvuO/Q3DjDk5lawIRaSxmszCMR3DRu1groxz037HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vkm9i/ZV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vkm9i/ZV"
Received: by smtp.kernel.org (Postfix)
	id 61906C4CEF0; Tue, 12 Aug 2025 17:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C36EC4CEF8;
	Tue, 12 Aug 2025 17:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755021561;
	bh=aoldne6qc5eX96kQefAJscUuf3bIWRMcyRa6pd4faY8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Vkm9i/ZVEIO1hb5KbjzOUFlhWeIPVIav1JOOALbzYIxoJIuXvUDO6W7BBtq7pWPWG
	 uCGGv7V2WMg3pSG7ez3BinpA3q0R8voAqTh/ia0F82x25jGQvPx+IzaTMtLE+n4Zzs
	 h10/k2Xtxk2kVkQ69huEmvz2ZwiLwYYXZZrndudYiNt/3S/GCPqqjRuxEtqFlXOgpU
	 OMcxb2Vnjd1Fi/cNXRLwf79WaQQ0+HUEBxMk5qWWgdyFVJR1802Esb7m8w7K3Pb3KD
	 gCy0bPEIMvLZiemyPyVd+ciCYEh6R316yPNCi+gnDQtmwOsVXHYodtoPRH1ToVZOFu
	 vQj1ZZJiBWmog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFD5CA0EE0;
	Tue, 12 Aug 2025 17:59:21 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Tue, 12 Aug 2025 19:59:15 +0200
Subject: [PATCH b4 v2 2/2] git_range_to_patches: set minimum similarity
 index to 95%
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-format-harder-v2-2-53f74982079a@oldschoolsolutions.biz>
References: <20250812-format-harder-v2-0-53f74982079a@oldschoolsolutions.biz>
In-Reply-To: <20250812-format-harder-v2-0-53f74982079a@oldschoolsolutions.biz>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755021559; l=982;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=AU+acsVaWeeFhgOmPkvemVaNu+t9PcDSpp4UH79XZ9k=;
 b=CnWGZ8FmPRYiCumCknELvDRaxC1xbVClRdko1RpqesIGaGUqEDXfS3W6Jy2TrjGKdjkOaUDvf
 Sd3lsL95EIlCfgP4laMDLCh2W/cz5Xi4F/nxXaO9sp7YbJdL1rUMTWb
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

There was an occurrence of (correctly) showing the diff to the original
source a file was copied from, but understandably it was classified as
impossible to review. [1]
To avoid this situation, require pretty high similarity to make it a
diff against the original.

[1]: https://lore.kernel.org/all/388aed37-03c1-4a5f-a425-5ed8c4f9cb34@oss.qualcomm.com/

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 src/b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 93cf016bd705584ace4d61c4968be365a25f2502..99198fe29aca34f09646775303638764b4a3fef1 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3596,7 +3596,7 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
             '--find-renames',
 			'-M',
 			'-B',
-			'-C',
+			'-C95',
 			'--find-copies-harder',
         ]
         smcfg = get_sendemail_config()

-- 
2.48.1


