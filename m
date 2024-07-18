Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FA013A89B
	for <tools@linux.kernel.org>; Thu, 18 Jul 2024 14:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721313905; cv=none; b=FzotTtY6K88OWZuksE/55S9YzhAxWIoqP2ROmQLrylNw+IqAufoAQxHKPVdqL4pJWoEsfAtv8hbQ1fmGh5GKs9MjZ7WLrnFMTQz0+c86pOgF/WvESChjwKIHINJBZnLeQyDKRatZypKr5UPjPrf1KnS60JgFgpXTm3BQdwQPunI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721313905; c=relaxed/simple;
	bh=Mu5flxSYFxyuqIKnZ0xMrOB2qKzEe+FIMmVr9/mCFBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dNpu//89qz8/tVAa4svKf3fvb16kAkgCusuofK5X6gnyJJYLz74xRtp6xfdNhC3oo63a2M431dDdqjt5AZ95rGSuHJ6ylWFYNAisoimzkeo+IE2MhnyRHT+GgRf4xL0wtjSwX71pvKlpLNVD/lxX+KRgV/PljLZ2aVNuEcyzXQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b=FR/E2g4W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="FR/E2g4W"
Received: by smtp.kernel.org (Postfix)
	id 8DB33C4AF0A; Thu, 18 Jul 2024 14:45:05 +0000 (UTC)
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CCA9AC116B1
	for <tools@kernel.org>; Thu, 18 Jul 2024 14:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CCA9AC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=pobox.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pobox.com
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id A60313C786;
	Thu, 18 Jul 2024 10:44:58 -0400 (EDT)
	(envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-type; s=sasl; bh=M
	u5flxSYFxyuqIKnZ0xMrOB2qKzEe+FIMmVr9/mCFBM=; b=FR/E2g4WFcjRXRYIy
	AjaXNHmBfa+VdsOVS+2kl1eh87CJ9BCLnf+GCZTA/Cox+KVIRWGPu+wk7c0ABXkL
	+u84gOm3rqs1VKC3c91hkeYMwY/T+cJFf5GAf4KGVM8oMb3LhrKnVPDznFyx97yc
	VTZShy3aXuJcJSrYY//0nx0EN0=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 9E7CF3C785;
	Thu, 18 Jul 2024 10:44:58 -0400 (EDT)
	(envelope-from junio@pobox.com)
Received: from pobox.com (unknown [34.125.139.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 142E13C784;
	Thu, 18 Jul 2024 10:44:54 -0400 (EDT)
	(envelope-from junio@pobox.com)
From: Junio C Hamano <gitster@pobox.com>
To: tools@kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: [PATCH] Support "valueless truth" in configuration parsing
Date: Thu, 18 Jul 2024 07:44:52 -0700
Message-ID: <xmqq34o6zrmj.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID:
 4B8D1B1C-4514-11EF-AF33-DFF1FEA446E2-77302942!pb-smtp21.pobox.com

With a configuration item somewhere (like ~/.gitconfig) like this:

    [sendemail]
        suppressfrom

"b4" barfs while parsing the configuration file.

The code assumes that "git config -z" output, after splitting at
NUL, would always be a LF separated variable and value, but that
does not hold for such a variable defined with only its name without
"= <value>", which means that variable is given the value "true".

Signed-off-by: Junio C Hamano <gitster@pobox.com>
---

 * It seems that this part of the parser hasn't changed at all since
   ae57d6ea (Initial commit after porting from korg-helpers,
   2020-03-14).  The patch was made against the current tip 47743a82
   (Improve tests exclusion from the built packages, 2024-07-17),
   but presumably it would apply anywhere.

 src/b4/__init__.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 7164d3f..ae15b83 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -2824,7 +2824,10 @@ def get_config_from_git(regexp: str, defaults: Opti
     for line in out.split('\x00'):
         if not line:
             continue
-        key, value = line.split('\n', 1)
+        if '\n' in line:
+            key, value = line.split('\n', 1)
+        else:
+            key, value = line, 'true'
         try:
             chunks = key.split('.')
             cfgkey = chunks[-1].lower()

