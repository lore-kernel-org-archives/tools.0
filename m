Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E7C15EBB;
	Wed,  3 Jan 2024 05:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QERbK7WH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D790FC433C7;
	Wed,  3 Jan 2024 05:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704258223;
	bh=YF+HatgupBd623IsHMLNpXEBNthXbW2TutZwKZYhmXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QERbK7WH3+cIO9UgNbJrlYlCYporVQNsGmEltkTJUOwyq2PZozvSEhb0lIFLtGset
	 iDk+m87kO6VSx0l7ZsojZKuGScAza+w51FuiH3iIC5e4pe/EEmuOk/EkDZ7IShkAXU
	 SfogA1PMiCrUhbEn8VVBvGou0hME3TlZNYaBVU14=
Date: Wed, 3 Jan 2024 00:03:41 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, users <users@linux.kernel.org>, tools@linux.kernel.org
Subject: Re: Re: b4 modifying Cc-tags
Message-ID: <20240102-exuberant-glaring-dalmatian-d62bc5@lemur>
References: <CAMuHMdVGqTM08DvsAjZ45wn1HTR0Grh8Ewj9q21pPwJmbok5hw@mail.gmail.com>
 <CAMuHMdVhyjjcyxMAGF8rAqmyqin=xjWH0fhhOjqbq7rH4f-RNw@mail.gmail.com>
 <20240102-axiomatic-gabby-whale-48d3bb@lemur>
 <CAMuHMdVtCfkLCb=d59XDELJO53jXJmo03iLcCwvMq54BFiUpFA@mail.gmail.com>
 <20240102-calculating-purple-dogfish-f4408c@lemur>
 <CAMuHMdW7+ENssXG4aim-Oa0T1pH-i5-YhVB9C+JaFoJjzuQK4g@mail.gmail.com>
 <20240102-debonair-beautiful-capybara-afced1@lemur>
 <20240103004415.42xndtocu2ggr2a5@pali>
 <CAHk-=wgZ-s0fHkxF-_7K5=WGW4G1ymom-nSHTFC+E-YAzPeTwQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wgZ-s0fHkxF-_7K5=WGW4G1ymom-nSHTFC+E-YAzPeTwQ@mail.gmail.com>

On Tue, Jan 02, 2024 at 08:35:19PM -0800, Linus Torvalds wrote:
> > For a longer time I had experience that DKIM signature was enough to not
> > mark emails as spam. But maybe spam filters changed and another
> > technique (SPF or DMARC) is required now too? (I do not have issues with
> > low traffic servers yet.)
> 
> DKIM with proper DMARC rules should be sufficient. At worst,
> unmodified emails can be re-sent from other places, but that's kind of
> the point of mailing lists, so that's actually an advantage.
> 
> But once you've set up DKIM/DMARC, doing SPF too should be so trivial
> that it becomes a "why not just that too?" issue.

DMARC requires both DKIM and SPF, so it's not really optional. We will soon
see further twists along that path as "Replay-Resistant ARC" becomes the next
required standard that will further complicate managing mailing lists, but
we're not there yet.

https://datatracker.ietf.org/doc/draft-chuang-replay-resistant-arc/

> I note that the kernel.org DKIM setup seems to use "c=relaxed/simple”,
> which seems bogus. I think it should use "c=relaxed/relaxed" because
> we just know whitespace is too fragile.
> 
> At least that seems to be the case with your email (which
> mx.google.com reports as
> 
>    dkim=neutral (body hash did not verify)
> 
> according to the headers I see).
> 
> Konstantin, is that c=relaxed/simple intentional?

It is, the important "relaxed" is the first one (header content). Nothing
should be doing any whitespace normalization on the body content other than
trimming any trailing whitespace characters, which is what "simple" does
already.

For example a "relaxed/relaxed" means these two Python snippets are identical
as far as DKIM is concerned, even though the second one clearly does something
else entirely.

    if logged_in:
        logger.debug('User is logged in')
        return True
    logger.critical('You must log in first')
    return False

vs:

    if logged_in:
        logger.debug('User is logged in')
    return True
    logger.critical('You must log in first')
    return False

-K
