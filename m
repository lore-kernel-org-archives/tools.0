Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8A63DDDCC
	for <tools@linux.kernel.org>; Tue, 15 Sep 2026 15:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486622; cv=none; b=l2pnciCV1YNOhW2gwitPejG5UwG7eXloyLq9atIqKs3S97VlLCDCuFnx2gkSJh6b1e/3+RUDmnbs0cRZLL6tGnkTLCkqKQCBtkOTdskcVlqsfGTIZ/qiBPe7GfojVTT/kS2cTfYwu0NoAZmef9HBG/0LUCaWPy2+X34b2MYZiR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486622; c=relaxed/simple;
	bh=MIm8klRH9Ctc6GXGguuLROu05hx4rIHs4dmNxgMG1lM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=LkTSwlEgSaI+hxtkMAoEzd3H8wfU/qy51sv6BCSOOj4nJUeISjIUivRdyZXcViuZzp2Bd0a4jN+2wDKkhBqwDRpp+rjwIVhdO6u74rXzWSUsFzV+8OG+QzpczOSxpY6ayEPF0Jk4F16k62a8mAKILmTlK+EYaCwyA2rzKU7Jwl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uENY7KtI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uENY7KtI"
Received: by smtp.kernel.org (Postfix)
	id 20FD71F00893; Tue, 15 Sep 2026 15:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5261F000FF;
	Tue, 15 Sep 2026 15:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789486621;
	bh=UpApDGnp/JbNNzVBRtST8irYwdzgyHCLLxqI7JXphFE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=uENY7KtIsZNcKssDToRML7AFzi/G/qcf3TLlb7gOtWkfW0y/MMN9nIca2ufaSekT1
	 KejV+PorZcaJBPx2UN4LamMBNuhsGCUgoHGSFROWnjGtxoS12GfQTHYviXtvat9wta
	 Xcgbunc4+bYdezR2yVg4PyiAd1zAui5ov6gKx5N0=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4] ez: include mbox "From " line in auto-to-cc input
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Brigham Campbell <me@brighamcampbell.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20260914-mbox-from-auto-to-cc-v1-1-fbf0c3fbd460@brighamcampbell.com>
References: <20260914-mbox-from-auto-to-cc-v1-1-fbf0c3fbd460@brighamcampbell.com>
Date: Tue, 15 Sep 2026 15:36:54 +0000
Message-Id: <178948661461.2456.11238163122005294748.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=885;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=MIm8klRH9Ctc6GXGguuLROu05hx4rIHs4dmNxgMG1lM=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLJWpkmXNj2olnX5vHb+duUnftoM66P6r2zbUT8v/sr2x
 AlOztymHaUsDGJcDLJiiixl+2I3BRU+9JBL7zGFmcPKBDKEgYtTACZyMofhn/H1SuEVKTNuh2ck
 Po37Pf2FRcia1hfv3UVktM5/6U5g+MfwP6fM+nP6SeWce+LCkTWlx+st7hkmPO84fOpu9Y4rSu/
 ZGAE=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> Include the mbox "From " line in the input to the auto-to-cc command.
> This reflects the default behavior of the regular `git format-patch &&
> git send-email` workflow.

Thanks. I will take this, but that whole subset of code needs a bit of
refactor.

> Why does b4 bother formatting patches "by hand" with `git show` and
> python's email module at all? `git format-patch` was made to do this and
> accepts `--stdout` if we really want to avoid writing the patch to a
> file for whatever reason.

This was the approach chosen because we need to reconstruct the subject
prefixes, inject headers, rethread depending on the CLI choices, and so
on. It's much easier to render the entire message header ourselves than
to parse the bytes produced by git-format-patch or rely on its CLI flags
never changing.

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
