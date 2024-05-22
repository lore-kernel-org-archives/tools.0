Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D9913E888
	for <tools@linux.kernel.org>; Wed, 22 May 2024 16:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716395228; cv=none; b=KEMztbW2L35CRXneTfx9wE+3o65zGrDYrJXg9sKX4mIl+1y47ahcjtJcD66KfhWEgqm8EuXcwdIlsXuP+RTniFGg+iQf1lw7pE48UZgosSHuiPKJ75FzhUcOxLQqxgDKun0hgzn0qEuthBtqpZvUZXDSvJIq9xl3vAznbDvkO+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716395228; c=relaxed/simple;
	bh=mlkR7PIqeoLufmP7ZAcw5+c8ikkX7aAY+Z/kwqMYNF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smhPRAVka3yigPnj+p9ax5w2le15u0Sh+WaIQSnVel3ZElPX23qsVotJira2Zf/0v7MgoUTbaDnFq3Uha00l/7+rTq8oy4sGYX/1Kc5aY9gwsEQuWhg8w1A43dkTFvPH9uk93YZGbpWKW7/6X6xYrjz9lRH/9azta1v7sE5Tdrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fy4JvGHM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fy4JvGHM"
Received: by smtp.kernel.org (Postfix)
	id 44462C4AF11; Wed, 22 May 2024 16:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3982C2BD11;
	Wed, 22 May 2024 16:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716395228;
	bh=mlkR7PIqeoLufmP7ZAcw5+c8ikkX7aAY+Z/kwqMYNF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fy4JvGHMztWvR9SRHz2ZXiWKc8DxNhHP4nqBWLEyVtCLYQ0xxyFbADgGoqF+7CkT6
	 vW8t7b0BWZpeIGXBnAAu0DTNSEi3IpHj73sO0VqVyKoUq0SfDB/UPdlvxKcj6x68Ja
	 lDek6UFFTuTf2X6S/p/Nb/eehKqHQYcil9ddTNrY=
Date: Wed, 22 May 2024 12:27:03 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 patch selection logic
Message-ID: <20240522-phenomenal-toad-of-might-4670c7@meerkat>
References: <CAHk-=wjt8e26xgW190=Ws2hrgDsDN6BhCie2do6uQqrcAzF6JA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wjt8e26xgW190=Ws2hrgDsDN6BhCie2do6uQqrcAzF6JA@mail.gmail.com>

On Wed, May 22, 2024 at 09:10:50AM GMT, Linus Torvalds wrote:
> But the message ID that I actually pointed at is a *different* patch
> with a different subject line, and is newer than either the original
> or the v2 in that thread. So I feel like the patch selection logic is
> a bit broken here. It's in the same discussion thread, yes, but b4
> shouldn't walk around and pick an *older* patch with a different
> subject line just because of that.

I agree that this can be more intuitive -- let me see if I can improve it to
automatically apply --no-parent logic when we recognize that a patch posted in
the middle of a longer thread is not within the same series.

Thank you for providing the use-case.

bugbot assign to me

-K
