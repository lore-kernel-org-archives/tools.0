Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEAF24DD15
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 11:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760354537; cv=none; b=IPe9AkqKaA9l2KUY5DHTy3NFXnxtQG+p8HpLMZPQYJavdVEidh8Eo3IQiGqvrGVdaIH/cUPeGptlDV6+cIQa3IYekaNmEqvby5zCBFKbu4ag8uD5VBZXpmCrcoTFXOLuxfPSg6aVtJ6FkZkSTYQxsuFfSdOmO5ZlVuMuVT07MF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760354537; c=relaxed/simple;
	bh=o+nQ/M51ADG2lYNftUBdt1pyL24HkkMkP7SFLLeFubg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvak8GZ0lOIzwAKDlkC0rV2uSMN7o/6zlwpqa0uMd/TClwlOYdi2zSzkFaJAmketY4GzF4Ec9XH5iE2CN5fMDhkvwa4VNZb2HuE9wRP1yRitbFYjXXPLNrnmOgdXPwBFFd0rzFCVNmDYkBeiq3vVyrmUaYUicbcDelvi99zTrKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lWRYh2Ch; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lWRYh2Ch"
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 14C2B169;
	Mon, 13 Oct 2025 13:20:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760354428;
	bh=o+nQ/M51ADG2lYNftUBdt1pyL24HkkMkP7SFLLeFubg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lWRYh2ChthIoJPd7GVuDi3juS4BRL7RkwYbV0f4FJxK20iN5Q+c+3/HlMDlXIZKYP
	 X2r4l62YEiyhLbftBfPQJ/Rea7uNr9/HJMyQE8US6yFyP+YLDgCS8EZeny1bHMw1Le
	 6dAm6HPvS33ayHsRkeDgKMRxhcFs/xn39Ae0kRmU=
Date: Mon, 13 Oct 2025 14:21:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Willy Tarreau <w@1wt.eu>
Cc: Jiri Slaby <jirislaby@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mark Brown <broonie@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@kernel.org, tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Message-ID: <20251013112159.GJ29493@pendragon.ideasonboard.com>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251011061351.GB23024@1wt.eu>
 <aOoyhUzNDgwiyl5s@finisterre.sirena.org.uk>
 <20251012232725.GC3938986@ziepe.ca>
 <d884ec6d-856c-4dce-b8bf-cb6116c87bcb@kernel.org>
 <CABgObfaL1Pki1QCgO_vb1Ex_1=RgVwzOmD8Z+q_KnPw3jHwBpQ@mail.gmail.com>
 <20251013084211.GH616@1wt.eu>
 <d4f8e576-ee8c-4b74-a260-78289a26ec07@kernel.org>
 <20251013085629.GK616@1wt.eu>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251013085629.GK616@1wt.eu>

On Mon, Oct 13, 2025 at 10:56:29AM +0200, Willy Tarreau wrote:
> On Mon, Oct 13, 2025 at 10:48:40AM +0200, Jiri Slaby wrote:
> > > Note that my understanding was that Linus wasn't against the use of
> > > Link but against its use to point to the series while he hoped to find
> > > extra information there, making it sort of a misleading use. That's
> > > why I think that placing another tag for those who value it makes
> > > sense and should not disturb him.
> > 
> > Let me cite from the thread :):
> > > We're not adding garbage that I'm "supposed to ignore".
> 
> Yeah but he was already angry and pissed off when saying this, that
> doesn't count. After all this time we all know how it is, and it's
> human to overreact from time to time when having multiple people in
> front of you asking for the same thing. Linus is a reasonable person
> who values efficiency, and if something that costs him nothing can
> improve his contributors' efficiency and quality, I don't think he
> would reject it once he's convinced it really has a positive effect
> overall. The point clearly is not to mix what he wants to visit
> (e.g. a paper explaining the background for some work) and the link
> to the submitted series.

I may be missing something obvious, but why do we need a trailer for
this kind of usage ? We've added links to commit messages for ages,
either embedded in the text, or with "footnotes" (i.e. [1]). One of the
advantages of standardizing trailers is that they can be parsed by
scripts. I see few use cases for automating retrieval of a paper
explaining the background. Footnote links would seem better suited for
links that support the commit message, as they can then be referenced
from a specific place in the commit message. That would free usage of a
Link: trailer for other purposes.

[1] This would be a foot note link

-- 
Regards,

Laurent Pinchart
