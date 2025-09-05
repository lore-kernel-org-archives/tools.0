Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD891F2361
	for <tools@linux.kernel.org>; Fri,  5 Sep 2025 17:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757095074; cv=none; b=FvuVq3C1MsuHp4RWlhH0zAy66Dntq0EIXhD5xChNPRaB9skiwz9X/g5Bf6UJwbL1cjhIikJKfGycZtMiOp5NBd7mr4etY92J17BFr1SVXXxGb2pG+oAVYTfQcgxnx8YLIts7c7AxW1QtzwGNfBorzQdJPlZWEBA9CZcfbj0J2sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757095074; c=relaxed/simple;
	bh=aptAdWausNvyy/48NKHPnmI2HsM9To1FF3eyD6r/d2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qjn3hhu/2gaqBc9M1aqjB7hp3BiFZNMN8AlElAhR+AKZBHa0RGneLw2lJGiuj0PgDynuJSVVB9OVELfptPIVKraOUziIjf1pHEhcU/UBaAXblXxKXU/C6lqETpKN2+RVniZStD706PTcnm6c6uq/tJ+zxkOZ8ZQm8NJ//XVSghM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 3A1D4C4CEF7; Fri,  5 Sep 2025 17:57:54 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A0A21C4CEF1
	for <tools@kernel.org>; Fri,  5 Sep 2025 17:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A0A21C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1uuagx-0000QH-IS; Fri, 05 Sep 2025 19:57:43 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Fri, 05 Sep 2025 19:57:41 +0200
Subject: [PATCH b4 v2] Don't parse nonstandard git-version suffix
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-versionparse-v2-1-4717edfb856f@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAJQku2gC/22NTQ6DIBCFr2JmXRogYmtXvUfjAmHQ2YAZLLEx3
 r3UdZfv73s7ZGTCDI9mB8ZCmVKsQl8acLONEwryVYOW2sheGlGQf53FckahQ3cz1kinwwh1sjA
 G2k7cC8YWhurNlNfEn/OhqDP5DytKKNHefa87b3un5HPBOL1XTpG2q0cYjuP4AnGFIN6xAAAA
X-Change-ID: 20250905-versionparse-2f675a50c2fb
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 kernel@pengutronix.de, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.15-dev-333fc
X-Developer-Signature: v=1; a=openpgp-sha256; l=2564; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=aptAdWausNvyy/48NKHPnmI2HsM9To1FF3eyD6r/d2o=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYsjYrTLtbtKlDt3ZMWk8hxkrrEpm3zg8/35x/QatmdHnz
 Ba3bRGf31HKwiDGxSArpsgSqyanIGTsf92s0i4WZg4rE8gQBi5OAZiISQDD/8yF7EKfmTSXCUzb
 t+T+oTnv93J1v/gn3q3izv5kqYQRXwPDL2b12TKv6rQMZibpTZnUaZqtdn5Dv8D7/IkbVy3s/B/
 lxgIA
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: tools@kernel.org

In snapshot builds of git, git-version yields a nonstandard version
format like 2.51.0.178.g2462961280. packaging.version.parse() errors out
on this with an InvalidVersion exception.

Since we only need to compare major and minor version, and
packaging.version is intended for a different version scheme, resort to
comparing the two numbers manually.

Fixes: 2e5aec1cd7ec ("Add Git version check to prevent crash with '--default-prefix' parameter")
Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
Changes in v2:
- Update commit message after git patch to change output was rejected
- Ignore patch version and regex-match git-version text (Thanks, Konstantin)
- Manually parse version instead of regex-filtering before a version.parse()
- Link to v1: https://patch.msgid.link/20250905-versionparse-v1-1-48d926da9c10@pengutronix.de
---
 requirements.txt   | 1 -
 src/b4/__init__.py | 6 +++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/requirements.txt b/requirements.txt
index ed9b832..3781f49 100644
--- a/requirements.txt
+++ b/requirements.txt
@@ -210,4 +210,3 @@ urllib3==2.4.0 \
     --hash=sha256:414bc6535b787febd7567804cc015fee39daab8ad86268f1310a9250697de466 \
     --hash=sha256:4e16665048960a0900c702d4a66415956a584919c03361cac9f1df5c5dd7e813
     # via requests
-packaging
\ No newline at end of file
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 33aee1f..07e1cb0 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -43,7 +43,6 @@ ConfigDictT = Dict[str, Union[str, List[str], None]]
 from email.message import EmailMessage
 
 from email import charset
-from packaging import version
 
 charset.add_charset('utf-8', None)
 # Policy we use for saving mail locally
@@ -2841,8 +2840,9 @@ def git_run_command(gitdir: Optional[Union[str, Path]], args: List[str], stdin:
 
 def git_check_minimal_version(min_version: str) -> bool:
     ecode, out = git_run_command(None, ["version"])
-    current_version = out.split()[2]
-    return version.parse(current_version) >= version.parse(min_version)
+    current_version = re.sub(r"git version (\d+\.\d+)\..*", r"\1", out)
+    return tuple(map(int, current_version.split(".")[:2])) >= tuple(map(int, min_version.split(".")[:2]))
+
 
 
 def git_credential_fill(gitdir: Optional[str], protocol: str, host: str, username: str) -> Optional[str]:

---
base-commit: 94e36c1a56583d2113cec6eaa99d5a28aab80009
change-id: 20250905-versionparse-2f675a50c2fb

Best regards,
--  
Jonas Rebmann <jre@pengutronix.de>

