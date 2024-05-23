Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436B812B171
	for <tools@linux.kernel.org>; Thu, 23 May 2024 14:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716475077; cv=none; b=lCOpuS8XTg3j9k5CryJ9Qt0Y84fNBliXSHQNPHUhnZg5M57M1xEx/xjPZSsZYGV6McBF1B5hhD91pVbD1pnrmT4VMqBr+4ewa0qHj74egsuB4uQcg7/TLpIXtjNUqhKFzQRgjwp4GD3KsM7UFZH6yjlP7CQT5zcW7MomR9Pg/u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716475077; c=relaxed/simple;
	bh=XIMUYnBytwOHAUSb8AEJ9gNv2z/MCxpkcEANul4hYb4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NFwhXE5reqg8ABsdPZEf81Iztdz9Un7FjIuLSSqoOat6jBTzMX+Rw/jYJZMH3Icz4LMYcWzO5jYTvgWs3jRCn/F3xE3znxT9dZYV4vBZN8LYGnQnLPzHpBAni9/Lqpo7b1ju1vt1JEtVXO9gVAuMW4TMMsEjl6a0Cerrv+it8zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zzftb/yo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zzftb/yo"
Received: by smtp.kernel.org (Postfix)
	id 2D1B9C32781; Thu, 23 May 2024 14:37:57 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D8549C3277B
	for <tools@kernel.org>; Thu, 23 May 2024 14:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D8549C3277B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716475074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2oM/kwf/Z39grbH8X2oQvKFwEzXhnoIlcvY75RjtHzY=;
	b=Zzftb/yozhrssIsUOzUSGqY/h4xcB+PaDJf9tdiJwoYTeYpX0ipVVGM7SinY7XBamfmdrN
	jXi7CzysPUu7OywOSsPi1jJ4UpOKI8pO7XkLXwKX4kBFOm8O+Z/OQgpWXswEs+hinpJbE6
	WRYeH5U8H4Zm/5n0AsvYzw5yORN69d8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-nALAsO4sO-Ckg3k_jnkxoQ-1; Thu, 23 May 2024 10:37:53 -0400
X-MC-Unique: nALAsO4sO-Ckg3k_jnkxoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0384B800CA2
	for <tools@kernel.org>; Thu, 23 May 2024 14:37:53 +0000 (UTC)
Received: from localhost (unknown [10.42.28.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C79672026D68
	for <tools@kernel.org>; Thu, 23 May 2024 14:37:52 +0000 (UTC)
From: Jonathan Wakely <jwakely@redhat.com>
To: tools@kernel.org
Subject: [PATCH] main: Use inbox.sourceware.org for repos hosted there
Date: Thu, 23 May 2024 15:30:16 +0100
Message-ID: <20240523143752.385810-1-jwakely@redhat.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Like the kernel, the GNU toolchain projects hosted on sourceware.org all
use email-based patch submission/review processes, and a number of
people are using b4 with inbox.sourceware.org now. This streamlines
things for those people.

I don't know if this patch would be acceptable for b4. It's obviously
very specific to sourceware projects, but then the existing default is
very specific to the kernel! :)

Of course this wouldn't scale if every public-inbox installation wanted
to hack b4 to work for their case too, but maybe GCC, Glibc etc. are
significant enough to deserve this special case.

-- >8 --

This adjusts the default config to use inbox.sourceware.org instead of
lore.kernel.org if the git repo's 'origin' remote is hosted on
sourceware.org (e.g., GCC, Glibc, etc.)

This avoids needing to override the b4.midmask and b4.linkmask config
for every sourceware-hosted repo, which helps people who contribute to
both the kernel and toolchain projects (so don't want to override
b4.midmask globally).

An explicit midmask or linkmask setting in .b4-config or git config will
still override this default.

The change only works if the remote 'origin' exists in the repo, and
assumes that if it does then it's meaningful, so somebody hasn't
configured remote.origin to point to sourceware in a repo that isn't
actually hosted there. This seems like a reasonable assumption.

Signed-off-by: Jonathan Wakely <jwakely@redhat.com>
---
 src/b4/__init__.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index fea7498..2b20ad6 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -2861,6 +2861,18 @@ def _setup_main_config(cmdargs: Optional[argparse.Namespace] = None) -> None:
     global MAIN_CONFIG
 
     defcfg = copy.deepcopy(DEFAULT_CONFIG)
+
+    # If origin is a repo hosted on sourceware.org then use its public-inbox
+    # as the default instead of lore.kernel.org. This will be overridden by
+    # any explicit setting in .b4-config or the git config.
+    originurl = get_config_from_git(r'remote.origin').get('url')
+    if originurl is not None:
+        if "//gcc.gnu.org/git/" in originurl or "//sourceware.org/git/" in originurl:
+            logger.debug('Using inbox.sourceware.org as default host')
+            defcfg['midmask'] = 'https://inbox.sourceware.org/%s'
+            defcfg['linkmask'] = 'https://inbox.sourceware.org/%s'
+
+
     # some options can be provided via the toplevel .b4-config file,
     # so load them up and use as defaults
     topdir = git_get_toplevel()
-- 
2.45.1

