Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8D521D3D9
	for <tools@linux.kernel.org>; Sun, 12 Oct 2025 23:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760311650; cv=none; b=DwymJ3me+9PQBL64Td9IQ365wye4Ll2hPneC+1Iz0TZi0KPROf+YOAIdki1Qx+OrxWseKeG99uXIDFtFQkTyoEQpsn2ps/3n40eNIL0ks0GtxRkWxAwi8GsdxvffC5y+4oconJaGsZGDbqNzdilXLFFuQpwobyO50Jpj3z6ued8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760311650; c=relaxed/simple;
	bh=lst0IipbevrjXaiv6Uat3uaWRtkEs7kHV07fZwyEs7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fsuaqnFJHPJESQYb4VI+xjwCJ+f3Vkl3waFEmsbP/kgw6MVVflm7kv+rFXODXqAr09TsCKGzT5hUHLg26QrIHxhaVTV3VQLaBQxouBuWUMPs7hwEGc0r0DvIRY8LJUy2F0oNWGSI+lHNxzRC/UoBkvYEsXdptOqOftZoNHle63o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=X/QHLNbK; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="X/QHLNbK"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-78f75b0a058so45967906d6.0
        for <tools@linux.kernel.org>; Sun, 12 Oct 2025 16:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1760311647; x=1760916447; darn=linux.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OCIT/Ocy+Kl+/9hr8SQlUwsotR5M6J0yyd1AU6UUcIA=;
        b=X/QHLNbK+UB76DKL7xhGDZku7XHE6qH+v9vD6kLDH+cuSFznMLSMbe+s/pLjKpq8bF
         fH0gU88XtTAj7XalpvrY7795LmlLD9Wd6XaP4N2rqY8ugxyJUEXe4ss8zphpTAJYHs4s
         wLMHe+8v7X4NFTVcv58dvZjlJcwUv6zWsn3HgIKypmDRi1tP4pFdwkeGV+oI09fVVTL/
         2/rcEDIpzJAakHU2g0sVmnkW/3kQv38WpYuMTo6Nsfg2CleOgUOzgjCeuM93SgYmDDyp
         38F9B5PohpJWj1o+UvC5X7MmSXaKn3awMZhL51ZGWQFh6n9ngjmif1G20Hg+5Q8w7X8C
         3V1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760311647; x=1760916447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCIT/Ocy+Kl+/9hr8SQlUwsotR5M6J0yyd1AU6UUcIA=;
        b=peb5eBOCMJb5eDJCqbsUtsYJUos9SKl/uQuuM3skrOe7Q4oLPwE0A1d16BXHxi5KTR
         cRd6CU0XrvIh1bODIi18iWhMqF7Qzo6ZXXArxaissVjXNxwLnKRP5QkLnOqmC1qqMG3t
         Slhnwuq6Fvm43Vh/piMqb2K1/tn+VEMzfvQIkEWFwrSH1pI3yuwwKfNdnt5u3FGcAPF5
         TBCftuPOzEFLIxv0FQ7rahax9IY0oBA/uU+eJ8EgYPgQAX7YdV3dR1lFyIFZTalm5Ktx
         ldJMjJE6VRfW7O44+uhcsgizx2U4JAJGIUTmTjIdXoTAYeBU1Mm2dstyj9hzjR1uoPBo
         vP6A==
X-Forwarded-Encrypted: i=1; AJvYcCUkhlbxsKa3O0TtMduY2F40p70nISm0+VirnKU/e3WWP+cFLflZuNlasv575nwRO5jpMfiHvg==@linux.kernel.org
X-Gm-Message-State: AOJu0YwA8uJiU0hiiPWGLCO7KVQUZKMepRSTmKrK5CJm5i0pfYpYE7mG
	HI8Ms0vkZBusRGlW4x3SULq5u9VSKrknarxoF3KAlj8uB2H4QNG3ySWIJmpO6JKWNng=
X-Gm-Gg: ASbGnctnAnfS/pNpwWI0se7MnL10BZO40ePSG7WtwOL3TmBj5r/va1mg3BYUDcEb2RY
	5PtO+HgxmLqQ2mm+BwzBMDTP8gGkELBCIsxFYh3WrKaiqszgWHuHe+o84Q4k18lU2Ym4ZmSHwob
	CKzu+uKAoCbfu/xHy1PpzFbIrQU0svcuSDEH/XEAJr9zpkubMCMv0szNxqy/pkWOunyROzrCvqT
	BBIckhjM2fCZMp52YWx2m7YwRQURso/fHRPUCBcmHgmGNBie9dDbyjhSRl0duhcERRBemG+u2gw
	oAhIkITcFjIDcQURLRH+xUdVHSnoGxh8gQC7tSp2WwKPRjVHmm32dhXj5F5KOgOi7wBYNxrapY8
	eu2sZG6t9zZPja0J9KUYuH0eWcpp85zTOhXgToL/uFGRmHB3pj3WBud7N2/cI3WjJ8wWyrV8vlN
	8xeLyKBqlYPpMMCbkGZ/dK/Q==
X-Google-Smtp-Source: AGHT+IEIy84Ow8L1wB+Ht7OcQ6KC5herCaiqIDzq3X3rLykh6ih1MLCyWGBZR90zApOralbDlluQmg==
X-Received: by 2002:a05:6214:19c8:b0:70f:a4b0:1eb8 with SMTP id 6a1803df08f44-87b210727afmr277710986d6.13.1760311647293;
        Sun, 12 Oct 2025 16:27:27 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87bc34b02f1sm59516006d6.28.2025.10.12.16.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 16:27:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1v85TJ-0000000Gsub-3iCo;
	Sun, 12 Oct 2025 20:27:25 -0300
Date: Sun, 12 Oct 2025 20:27:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mark Brown <broonie@kernel.org>
Cc: Willy Tarreau <w@1wt.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@kernel.org, tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Message-ID: <20251012232725.GC3938986@ziepe.ca>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251011061351.GB23024@1wt.eu>
 <aOoyhUzNDgwiyl5s@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOoyhUzNDgwiyl5s@finisterre.sirena.org.uk>

On Sat, Oct 11, 2025 at 11:33:41AM +0100, Mark Brown wrote:
> On Sat, Oct 11, 2025 at 08:13:51AM +0200, Willy Tarreau wrote:
> 
> > Maybe what would be needed would be a "Lore" (or "Series" or "Discussion")
> > trailer that automatically makes a lore link from the message-id, and
> > which would explicitly indicate that there's nothing else there but the
> > actual patch submission, contrary to Link that's for any extra info ?
> > It would be added by "git am" when passed a specific option.
> 
> There was an attempt to do that with the https://patch.msgid.link
> domain, that's basically the same idea just done with a domain instead
> of the name of the tag.  Linus wasn't any happier with that idea
> unfortunately.

FWIW I thought that was a great compromise and have been trying to
follow the 'if it is mechanical information it is msgid.link' and 'if
it is deliberately meaningful then it has a [1] footnote and a lore
URL'

IMHO, I think a 'b4 dig' like tool is a great way to address Linus's
use case of: 'show me all mailing list discussions about this commit
and highlight what might be interesting'

I think including the msgid.link would make this job of b4 dig work
better.

Like others in the thread I use the Links directly quite a bit, it
works well and is convenient.

eg I posted a bisection found regression 6 months after the series
was accepted and got a fix:

https://lore.kernel.org/lkml/20250917153209.GA2023406@nvidia.com/

Responding to the original series is the easiest way to get a solid
list of interested parties.

Jason
