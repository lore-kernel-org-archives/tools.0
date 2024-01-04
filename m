Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B0223C6;
	Thu,  4 Jan 2024 00:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TwHPNsKb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60C8C433C7;
	Thu,  4 Jan 2024 00:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704328872;
	bh=+3OG2pSMTHqHD3LCy6xZKP0ngKNY48k4Ar8TejeKydI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TwHPNsKbAcNfKqE4/7SvqpoxIa2QAHpuF1ilxIVym1Owf4lYhDulJDyKvBLua7AEY
	 B6tDUasuXOJqnY0FOMC986SE6ccMNayrQqDhTv9ue4S14xiCB8LW5cZlfV/Kviaryn
	 /erImpma3zQwc5jcTDRBRKdakR6xve5XMtEgkvGqoEeASfYI5biF89BgfHYwYGkF9E
	 2Kz+R+eB4GJUHwR7zgE5gQaCd56RnWNWsGYprO+WpUZrRuBRt9Fmfl1FuOdnmHu9iB
	 QzjR9BQgt65RK+FXYEct/2bWNZdGHTtJCAnK2WNySvB0LJdkRqAWT+kgEvUP0k6oc4
	 bFdmWQHtfJ+yg==
Received: by pali.im (Postfix)
	id BFBAF740; Thu,  4 Jan 2024 01:41:08 +0100 (CET)
Date: Thu, 4 Jan 2024 01:41:08 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users <users@linux.kernel.org>, tools@linux.kernel.org
Subject: Re: b4 modifying Cc-tags
Message-ID: <20240104004108.zs3wlfju6gzfl2mo@pali>
References: <CAMuHMdVGqTM08DvsAjZ45wn1HTR0Grh8Ewj9q21pPwJmbok5hw@mail.gmail.com>
 <CAMuHMdVhyjjcyxMAGF8rAqmyqin=xjWH0fhhOjqbq7rH4f-RNw@mail.gmail.com>
 <20240102-axiomatic-gabby-whale-48d3bb@lemur>
 <CAMuHMdVtCfkLCb=d59XDELJO53jXJmo03iLcCwvMq54BFiUpFA@mail.gmail.com>
 <20240102-calculating-purple-dogfish-f4408c@lemur>
 <CAMuHMdW7+ENssXG4aim-Oa0T1pH-i5-YhVB9C+JaFoJjzuQK4g@mail.gmail.com>
 <20240102-debonair-beautiful-capybara-afced1@lemur>
 <20240103004415.42xndtocu2ggr2a5@pali>
 <CAMuHMdXxzhddGOoxXLxNoyHX2NnLad2PRz9V1sGd_or6UWFkMA@mail.gmail.com>
 <f8d3ddc69bd95bc8553b5908523e55e0be245e84.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8d3ddc69bd95bc8553b5908523e55e0be245e84.camel@HansenPartnership.com>
User-Agent: NeoMutt/20180716

On Wednesday 03 January 2024 08:19:15 James Bottomley wrote:
> On Wed, 2024-01-03 at 13:26 +0100, Geert Uytterhoeven wrote:
> > Hi Pali,
> > 
> > On Wed, Jan 3, 2024 at 1:44 AM Pali Rohár <pali@kernel.org> wrote:
> > > On Tuesday 02 January 2024 15:49:45 Konstantin Ryabitsev wrote:
> > > > On Tue, Jan 02, 2024 at 06:03:44PM +0100, Geert Uytterhoeven
> > > > wrote:
> > > > > > Overall, I would suggest that whoever is responsible for
> > > > > > linux-m68korg sets up all the bits required by the modern
> > > > > > email delivery stack (DKIM, SPF, DMARC).
> > > > > 
> > > > > That would be me (partially ;-)
> > > > > 
> > > > > Looking at linux-foundation.org, I guess that means adding a
> > > > > TXT record with
> > > > > 
> > > > >     "v=spf1 include:_spf.kernel.org include:_spf.google.com
> > > > > ~all"
> > > > > 
> > > > > + whatever outgoing servers the users of linux-m68k.org are
> > > > > using?
> > > > 
> > > > That wouldn't be sufficient, because setting SPF by itself won't
> > > > really do anything without DKIM signing as well.
> > > 
> > > Is not it really sufficient to have at least one of them? Because
> > > these things are different.
> > > 
> > > SPF in DNS zone specifies which IP addresses are allowed to send
> > > emails from that DNS domain. DKIM is a signature in the email
> > > header, signed by the private key and reference to public key is in
> > > the email header. Reference can point to any DNS domain. Also in
> > > email header can be more DKIM signatures (e.g. if email is going
> > > throw more email servers and every one signs email). So basically
> > > these techniques are orthogonal to each other.
> > 
> > That was my understanding as well...
> > 
> > > I would recommend you to at least try to setup SPF into your DNS
> > > zone and see if it improves situation or not. In the worst case you
> > > would have to revert setup back.
> > 
> > I could do that, after obtaining a list of all outgoing email servers
> > used by all linux-m68k.org email users...
> > E.g. I use Gmail, and my ISP's SMTP relay for sending patches
> > (I did set up an app-specific password for using Gmail's SMTP relays,
> > but last time (long ago) I tried, Gmail always replaced the address
> > in the From: line by the default address configured in Gmail,
> > breaking other addresses and any "+<sponsor>" additions).

Have not you tried to register/link also additional account with that
"+<sponsor>" suffix into your gmail account? I would expect that gmail
allows to set only registered addressed into From: header and maybe
additional +suffix needs additional register/link.

> 
> Technically if you're going to do SPF like that, you can also do DKIM,
> you'd just have to distribute the DKIM key to everyone who uses the
> server (or more likely, give each one their own DKIM key and label
> which means you can revoke if one leaks).  Each sender would have to
> run something like their own opendkim instance, which adds complexity
> on the transmitting end, but it is possible.

Interesting idea. It is truth that you can have more more DKIM keys in
DNS zone (every key has its own record) but I have never heard that
every user would have its own key, and do signing during sending email.
For me it sounds like totally crazy idea. But when thinking about it,
maybe it would not be such hard to create filter which reads email from
stdin, DKIM-signs it and writes to stdout. Then it would be possible to
combine it together with sendmail or msmtp binaries and git send-email
or any other tool would work without issue. Also creating DKIM signature
should not be such hard, so the filter application/script can be written
in Perl or Python. IIRC git-send-email is written in Perl, so it can be
extended to also append DKIM signature and no need for external daemon
like opendkim? Private key can be read from config file, like smtp
password. :-)

> But I have to say, all this is much easier if your mail domain has its
> own system for both sending and receiving.  They're not usually that
> expensive (tens of dollars a month) and there are lots of people on
> this list who still run their own email servers, so there's a wealth of
> technical expertise here to help you.
> 
> James
> 
> 
> 
