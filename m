Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9463E211475
	for <tools@linux.kernel.org>; Wed, 22 Jan 2025 16:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737562252; cv=none; b=lSeo9p5JUvbnePpwRIIWbej5VODFwklijP+UBGlU7jeqGxV5KkHU9+IEydOjEbr8nvTdi/s7JzeRZZFRBokLLTzg+d+rhsjmbmM4vFYk7igHSgO/WkKDF0GfsPs01eXF9v2RxYatOBORuZJqOas88t6VPNv+Ihzu0hZhIbMi8mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737562252; c=relaxed/simple;
	bh=Ffom7BCKhmvU945k8IPnjKV6235BrM24JUrCfB3A72E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZisiqwASXRJe7Hx52wozpVDYlKDf3JRfV+SFr2roOAWza7CSOIFsKa+kXvhRDMbSoS3hV1zdVhHINiDmx0T6KmP0aFx97dR5WjrVzniK4zItwHBf09Yidy/MSGZroofdTPwSy57vKuNDy0wN7F7pkRafbDgWZItka4arnp+hj3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Dt384ftz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Dt384ftz"
Received: by smtp.kernel.org (Postfix)
	id 2401AC4CED6; Wed, 22 Jan 2025 16:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98F1C4CED2;
	Wed, 22 Jan 2025 16:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737562252;
	bh=Ffom7BCKhmvU945k8IPnjKV6235BrM24JUrCfB3A72E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dt384ftzuZl0srQi+EL3tMAy71+6EZhnEotx+TtzWyocbFy4lyR3VqwJNI8TUrZIf
	 fM8RTGEwOM6jdy6qMVv/ZX6vmamLYO2dgvifKNBsDCg4a+mcTqbnBMPkG3WQMBnUMQ
	 h9RDdrHgaBI6mithpTLSTRm5Q51DyVQAXjSQc+TY=
Date: Wed, 22 Jan 2025 11:10:50 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 v2] send: generate patches with --no-mailmap
Message-ID: <20250122-dinosaur-of-perfect-conversion-7dfabc@lemur>
References: <20240923-send-mailmap-v2-1-e2c62f1de79b@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240923-send-mailmap-v2-1-e2c62f1de79b@kernel.org>

On Mon, Sep 23, 2024 at 06:04:31PM +0200, Matthieu Baerts (NGI0) wrote:
> b4 uses 'git show' to generate patches. By default, this command will
> use the mailmap file to convert author and committer names and email
> addresses if there is a match.
> 
> That's good to display the last identity when looking at old commits in
> the history, but it doesn't sound like a good idea when sending patches.
> 'git format-patch' doesn't use the mailmap file, it currently doesn't
> even support it, and it is not planned to support it apparently [1].
> Note that 'git send-email' might support a new '--mailmap' option, but
> it looks like this option will not be enabled by default [2].
> 
> In my case, I had to send some patches, including one from someone else
> who has to use the email address from his company, but has an entry in
> the mailmap file to his @kernel.org email address. When I sent his
> patch, b4 seamlessly converted his email address, and caused checkpatch
> to complain, because the From and the SoB entries were different.

I've been sitting on this for a bit, simply because I'm 50/50 on whether this
is the right thing to do. On the one hand, I see your point, but on the other
it seems that if there is a mailmap entry, then the person would probably like
to prefer to receive mail at their new address, not at their old one.

What does everyone else think?

-K
