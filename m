Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E57A34A326
	for <tools@linux.kernel.org>; Fri,  5 Sep 2025 12:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757074109; cv=none; b=nUAVmc0W8qCKBK/SijCUmwij6/7bM7R+kx18np0UxUUhmVCoNdP7t8RMHuupqC9PJheekzeAnzzG6ASUgty/D5BIILttfwDYK+eRIOJ49f3kFuRmeVBkPHXc/PuiVFG2JV/eo7bCn9DnQ2l6xAWiqbof7fPKu+TI1+/8ldXP7ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757074109; c=relaxed/simple;
	bh=O0fnhosAfMzxWjYKuaWV5492TL9kcI3D1Dpn87bYD3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uYzK2gbwcupCeBpWdGi8OGWyae1Twx0EnaZApL01XlOGm8lumsZDgahcofyxm2Kfh/GRqZZhiLIjC9jHWECnGuBOVsnDLtoBWsT2oHaULDwOFEffXlP3/8j+Kg2DYxMqSczk4+7nYIIOAMfiC5HdZQiF3TskkgXybsx0X4/WgzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 9C835C4CEF7; Fri,  5 Sep 2025 12:08:28 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C8F1DC4CEF1
	for <tools@kernel.org>; Fri,  5 Sep 2025 12:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C8F1DC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1uuVEt-0006Su-QW; Fri, 05 Sep 2025 14:08:23 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Fri, 05 Sep 2025 14:08:15 +0200
Subject: [PATCH b4] Don't parse nonstandard git version suffix
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-versionparse-v1-1-48d926da9c10@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAK7SumgC/x2MQQqAIBAAvyJ7TjDJor4SHczW2ovJChKIf886D
 sxMgYRMmGARBRgzJbpDg74T4C4bTpR0NAattFGzMjIjf060nFBqP07GGuW036ElkdHT8+9W2Af
 Yan0BkgslDGIAAAA=
X-Change-ID: 20250905-versionparse-2f675a50c2fb
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 kernel@pengutronix.de, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.15-dev-1387e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1677; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=O0fnhosAfMzxWjYKuaWV5492TL9kcI3D1Dpn87bYD3M=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYsjYdWnTWrYv6SstpW2yt2skCxuyqk0QSZf6tExxaWp3k
 NWUays8OkpZGMS4GGTFFFli1eQUhIz9r5tV2sXCzGFlAhnCwMUpABNxmMnwP36WRf3hf1zFWc05
 MQ+OVB/399HjmiJ7dCqz46RQz/+LljL84f6dMlPxx7yivB3rI0ytshqX9MRv3xET88Q/wGclU3k
 GGwA=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: tools@kernel.org

In snapshot builds of git, git-version yields a modified variant of the
git-describe output, e.g. 2.51.0.178.g2462961280 instead of
2.51.0-178-g2462961280 for seemingly historical reasons.

This leads to b4 erroring out with `packaging.version.InvalidVersion:
Invalid version: '2.51.0-179-g5279fa1e15'` because is not compatible
with python's versioning scheme expected by packaging.version.parse().

Neither is it semver compatible.

Work around git-version outputting nonstandard versions by stripping any
suffixes before parsing.

A patch to make git-version's output semver compatible is on its way.
Once applied, this workaround still works but can be dropped in favor of
switching b4 to a semver parser.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 src/b4/__init__.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 33aee1f..64f8dd2 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -2842,6 +2842,8 @@ def git_run_command(gitdir: Optional[Union[str, Path]], args: List[str], stdin:
 def git_check_minimal_version(min_version: str) -> bool:
     ecode, out = git_run_command(None, ["version"])
     current_version = out.split()[2]
+    # Strip version suffix to work around git-version's non-standard output in checkpoint builds
+    current_version = re.match(r'^[0-9]+\.[0-9]+(\.[0-9]+)?', current_version).group(0)
     return version.parse(current_version) >= version.parse(min_version)
 
 

---
base-commit: 94e36c1a56583d2113cec6eaa99d5a28aab80009
change-id: 20250905-versionparse-2f675a50c2fb

Best regards,
--  
Jonas Rebmann <jre@pengutronix.de>

