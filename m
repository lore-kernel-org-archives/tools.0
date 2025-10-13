Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D5725A65A
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 08:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760344943; cv=none; b=jKgRZxReVBkF3u+iAJOaRyy5ky9cx+Kt0uRCwdiC4ibIXAOUYnZZVu7AiRVBukKM4Rz0AMVl9c8pZskOXZnM2fepJ1YKhut9UWEooj/Zyx8q0HasKQ2dkeOZdrBxIvrWBWVTzlU6++ISpFpK0+TabLdxO05KALq6ENZMgvPsuQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760344943; c=relaxed/simple;
	bh=HoVL6HnNnxyOff4Y5Wix1I+F/bNv8FWSGiRTSC5Cl3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qK58B3z0OQ254umGXI8K2rw6MJv6306NYa8E6RFnbkFnES+xzO+ZOy/T40Ps7ddK1IV1J+ghiv0O8QKA9P6SYOdWOqKTadIOnJ7+npGvd5kvStLmtViT+Pci6U/Y6I40ZgE1J82CkOx6NOWeUn1/zhy8q4trY+zV6TbTKUb5Qdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=o0O03yjc; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="o0O03yjc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1760344932; bh=PY+eU1vMdzvEl/qQUYN5g31OYWaVdttGWXhRaFqYAwI=;
	h=From:Message-ID:From;
	b=o0O03yjcSXfHyNQtjmRysYfnZiY6QJ/P1RiukBLqB2ktnT6O8M6RyEvVBNALHuC3w
	 AsihIA25dMBnXS9/UD0xYQKllxX2YxFFI/CK7RzDETa19WBI6hnZ26txwPn3/4vop0
	 09hES9RrYIOmLN4G4+cwDIpxtuj236au52J7+xU4=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 4292DC0916;
	Mon, 13 Oct 2025 10:42:12 +0200 (CEST)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 59D8gBPF000800;
	Mon, 13 Oct 2025 10:42:11 +0200
Date: Mon, 13 Oct 2025 10:42:11 +0200
From: Willy Tarreau <w@1wt.eu>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>, Mark Brown <broonie@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@kernel.org, tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Message-ID: <20251013084211.GH616@1wt.eu>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251011061351.GB23024@1wt.eu>
 <aOoyhUzNDgwiyl5s@finisterre.sirena.org.uk>
 <20251012232725.GC3938986@ziepe.ca>
 <d884ec6d-856c-4dce-b8bf-cb6116c87bcb@kernel.org>
 <CABgObfaL1Pki1QCgO_vb1Ex_1=RgVwzOmD8Z+q_KnPw3jHwBpQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgObfaL1Pki1QCgO_vb1Ex_1=RgVwzOmD8Z+q_KnPw3jHwBpQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Oct 13, 2025 at 10:27:09AM +0200, Paolo Bonzini wrote:
> On Mon, Oct 13, 2025 at 10:24 AM Vlastimil Babka (SUSE)
> <vbabka@kernel.org> wrote:
> > That's all nice and everything Jason, but Linus has been very clear on this,
> > so it's just beating a dead horse now.
> 
> My problem isn't with dropping Link, it's with not having a
> replacement and messing up the workflow of >1 people. I'm not calling
> for civil disobedience or anything :) but it's not like Linus hasn't
> ever been wrong.

Note that my understanding was that Linus wasn't against the use of
Link but against its use to point to the series while he hoped to find
extra information there, making it sort of a misleading use. That's
why I think that placing another tag for those who value it makes
sense and should not disturb him. It's not a matter of disobedience
but making sure everyone finds the info they need at the right place
without wasting time trying irrelevant links nor digging everywhere.
Linus is not the only consumer of trailer tags, but he definitely is
one. Let's just find something that makes everyone happy (i.e. link
for extra info and something else for patch series).

Willy
