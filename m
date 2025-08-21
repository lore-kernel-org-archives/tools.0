Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553C1322754
	for <tools@linux.kernel.org>; Thu, 21 Aug 2025 15:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755790040; cv=none; b=EA/ZYdrZW8wNyz+kIgh+J0R1sRqlfpG+8fHhLoaiuL+IpQacuQSVac2//NBo2xdVzM76IDSzrqLABKv5akF+DWmr40FtwryYt1hkPeuxgHYg8MmDNYxxDSx+HX6/lRrxuHaHHMTFcDr+094V+FZKq+083NesdovWQdu+JTMdn58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755790040; c=relaxed/simple;
	bh=LLRSfdQb7ItmCBym/18aCmknLYpaGIHpP5O7eQmrLCk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZKYLbQuWPryG5CtcMAYznffdZJPuSNJyvPkQpuSYsj+Yf9ScrXg5nP/Iq+o9cNoMYqSx0U9OzNsPvpBFDZv+PtzljqSxNMqFSbT39OI0hjbY1oZnFfhqprIgnVXQ4BvDWdxVr7HxIjTF5sO7/ORUmO1XlO1lyxXXpMgPXcTsBLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=QDV+leTz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="QDV+leTz"
Received: by smtp.kernel.org (Postfix)
	id E20D7C4CEF4; Thu, 21 Aug 2025 15:27:19 +0000 (UTC)
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5391C4CEEB
	for <tools@kernel.org>; Thu, 21 Aug 2025 15:27:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E5391C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=4pVh3eDPV4GNM0tjlh37B68HhQrxtk+5ECKsOt8ZZ24=; b=QDV+leTzhSJw+wxb2ofEa5+H9M
	FR8Ah36RuejoHugu1WEwPKY4bCp2ns+LV6LEjbjfOQ2vNPLtwQsxmu752JwLbEYReFsUn/5WZXq2B
	w7LyUTQzfqUGxxzvp8zCcFfAWjj96RnsecxRsRmxo3zM7a9DFR03gL2UepZ7zHtcw7N+qZmip1tjA
	/mAU+2Ghv+Q7Sr9fPNaFwMzUNNuuiWNO5O822g2sO2uSt6LfLS2MTfZIN0Ja71AAabhf7cE6AYwo1
	plYB7yxKRfMUMN/nn+Q1RmJVh/uUBeL5WUyF43SmGqqz8Pe/jCY8DEB1fDkkB9nTYB4wyR+j/9VFv
	ijipegfA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: tools@kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2] use username without empty comments from gecos field
Date: Thu, 21 Aug 2025 17:26:39 +0200
Message-Id: <20250821152639.18903-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid trailing ,,, at usernames. The gecos field does not always contain only
the username, adduser puts additional information like room number, phone
numbers and other information separated by comma there. Often these are left
empty, and you have these commas at the end.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v2:
- more descriptive commit message
- strip instead of remove_suffix to improve compatibilty

 src/b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index f425fd6..33aee1f 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3165,7 +3165,7 @@ def _setup_user_config(cmdargs: argparse.Namespace) -> None:
             USER_CONFIG['name'] = os.environ['GIT_AUTHOR_NAME']
         else:
             udata = pwd.getpwuid(os.getuid())
-            USER_CONFIG['name'] = udata.pw_gecos
+            USER_CONFIG['name'] = udata.pw_gecos.strip(",")
     if 'email' not in USER_CONFIG:
         if 'GIT_COMMITTER_EMAIL' in os.environ:
             USER_CONFIG['email'] = os.environ['GIT_COMMITTER_EMAIL']
-- 
2.39.5

