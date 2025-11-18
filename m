Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2294F2F6168;
	Tue, 18 Nov 2025 20:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763498461; cv=none; b=rxLIWcUOUkMKts4+mWLP2ft1jwr6tyN78rj1KrfyfSHdTySUBrmKEek1Avm3V/O3AX6aold+2BSaESxeYiHPltHWYxgVgCb2UMv4sSz2S3HWZXCeKZT6uB0LnVRCNHzEqVphSJUFLeA2fapsRluLHvuPmrf+qUt5ceqBnSdif9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763498461; c=relaxed/simple;
	bh=85i5tGf+MCJhH2jUO2v5FmS/4QVC/b+pOvNWxMB8t2M=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=qpiN0baol1KHp3PQLO7BWkXHKDSMhb5bwbUIFxA4pAWvh6ibhO9SpA+fUd3r9OgdMdUDM6Oz7l96lwwo+cxmA31MRkrI9nNMgjRNpRdEfowATbfIJBh/IcpBNJZj2lG5WjWrnQOHOOLCZy3o2Qa94fxRCzFfqHkYaFKRaU+gd3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJ4XAplS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJ4XAplS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52843C116D0;
	Tue, 18 Nov 2025 20:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763498459;
	bh=85i5tGf+MCJhH2jUO2v5FmS/4QVC/b+pOvNWxMB8t2M=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=PJ4XAplSAVvSf4KVw1ZPbwoFv+mis9XyFSYnOElMooCAxYCCbaawtXVtH6u+mPPj/
	 FdXiMpbwdroSM75oU3Sbb2NfVKNvTRqng0u/h5QspqXuNgX7EmOU9vC2y/iDDj/bRO
	 mQ6on9NDl5n4+CHV6/yDcISj2trrDRQwMzRNAwrFcI/o5erur3Ci8TrLKvDtN8uqBR
	 xE31KebiaBqE87t2GUOKQz15SKAl0O4nZ/J04Y1fAqRH9vWK6O4VJFEPZf5kTgQI7m
	 qa6Bx1UmQ3tAp2WdfWSw+DHrDBtnqf+72zTS00csGNxqQOu86IzwM7ZB56l10XO8um
	 gtbwgbg6Mdjpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EEEEB380A948;
	Tue, 18 Nov 2025 20:40:25 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: erik.schilling@linaro.org, konstantin@linuxfoundation.org, 
 tools@linux.kernel.org, bugs@lists.linux.dev
Message-ID: <20251118-b217642c6-fcebc74d7e6d@bugzilla.kernel.org>
In-Reply-To: <CTPW75Q2ISUN.251ELTNP6RB22@fedora>
References: <CTPW75Q2ISUN.251ELTNP6RB22@fedora>
Subject: Re: Allow sending prefixes before [PATCH]
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev
Date: Tue, 18 Nov 2025 20:40:25 +0000 (UTC)

Antonin Godard writes in commit d7232f5db2e4379bd9372b00707a78ec8d36b44a:

Add support for setting a presubject

Some mailing lists require a prefix to come before the [PATCH] in the
subject of emails, such as OpenEmbedded or libgpiod. The current prefix
mechanism does not allow for that (only after PATCH), and setting the
format.subjectPrefix Git option does not work either.

Add a new configuration option send-presubject as well as a
--set-presubject argument to be able to include anything that should
come before the subject. The logic behind prefixes is not changed and
this new option does not break any existing prefix assignments.

In order not to break the logic in LoreSubject's __init__ function,
which parses the subject line and strips brackets in order to reorganize
the subject line later, the presubject must be enclosed with brackets
too (_check_presubject() is used to ensure that).

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217642
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=d7232f5db2e4)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

