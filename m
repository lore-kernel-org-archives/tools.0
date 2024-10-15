Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFDB1C4A04
	for <tools@linux.kernel.org>; Tue, 15 Oct 2024 13:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728998652; cv=none; b=fj8B8qKY1XfgBEu+EGSZApLz9tkgmCYCB5ad0r3pzQobEVv+s8Y2FCSoyA03odAmmSuvLyYhdC4gMjxdVW8wu1XKadaPln5ufk/GI81PABVZoOR/7nFisP+S8yVTDyZSEYZr4sWK5puM1hYPdoQARn5vShwcQYOb2ptdDQEYlGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728998652; c=relaxed/simple;
	bh=xNeivxtp/8EHEArClZgEaYp/a4dlOY0zQfUxy+iatso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aE8dOeOLW5BRGCgr6I7HCx+XaEAVqGj0r7MycbsRuIguIOYWEbNEchCq+MmOl2ySdAcl6jtWS1FIr3kTCkqD5WCJNI9vMm3eAIhIm7ZT7vIwKFV+fYm8Bqxayp8cxEkNb9O423bAtVmXbNUm8ZjbZ9BslWKvfttSB8hJoqQDLPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sop8v0B2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sop8v0B2"
Received: by smtp.kernel.org (Postfix)
	id DF689C4CECF; Tue, 15 Oct 2024 13:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACDA3C4CEC6;
	Tue, 15 Oct 2024 13:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728998651;
	bh=xNeivxtp/8EHEArClZgEaYp/a4dlOY0zQfUxy+iatso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sop8v0B2T7Y7+GncXlnKZQwqQDDYTId/mpT8h5FH+dBymaiADn1OD0BnMbr4xuIoI
	 v7QWnGSRViC/amg3esQPBTCD5o7kmH+HoYsefY1O23zrBQSAG7aajp7OrRxBu+HkLj
	 EjnDlUlaY8FAH+Q5C+orNkyxPPYMdT8XiAIPOvV0=
Date: Tue, 15 Oct 2024 09:24:10 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Jonas Gorski <jonas.gorski@gmail.com>, tools@kernel.org
Subject: Re: b4: adding/updating individual patch changelogs?
Message-ID: <20241015-discerning-chimpanzee-of-efficiency-0b62d8@lemur>
References: <CAOiHx=nHXJLVM2ZfDGEi+VDYPhVuoZdpYhLTQwAGLgUiVmZvpw@mail.gmail.com>
 <ZwuiaKj1pgjZ3-sR@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZwuiaKj1pgjZ3-sR@finisterre.sirena.org.uk>

On Sun, Oct 13, 2024 at 11:35:20AM GMT, Mark Brown wrote:
> > is there a way to add/update changelogs to each patch of a series?
> > prep does it automatically for the cover letter, but I find no option
> > for the individual commits themselves, or it even mentioned in the
> > docs. Ideally something where b4 automatically updates the changelog
> > (templates), but I'll take anything that does not require manually
> > editing the generated patches themselves every time.
> 
> If you add a --- and text at the bottom of your changelog in git then b4
> will (or did last time I needed this) just reproduce that in mail that
> it sends.

That's the recommended way to do it, yes. Until git-filter-repo is able to
preserve git notes, there isn't really any other way to go about it other than
keeping things in the branch-description config value, and I'm worried that
it's going to be both fragile and without any way to push it to a remote.

-K
