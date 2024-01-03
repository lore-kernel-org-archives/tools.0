Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CC0199AA;
	Wed,  3 Jan 2024 13:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="oJH6ItBD";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="S3eYO+Z8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1704287958;
	bh=OWnU8kC5wLl9ctH/HNAKIYvqu9XdGQ8M1cPGVtVU4rQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=oJH6ItBDb4LTP+8U3xDznMoMaQOzyr/cwIh8zMxP13WJV2JjHXaJQM7rXty7NpeOq
	 mFEGF8sy/Jrak3KKpjU+C7GRLkJUQvCvBd651gEoVC6swOa8zooOn4wzrDhaf7Dtsg
	 EcYyTs2KUTAvbSkGlMSRIFKBZrQctPcTTDPKeIoo=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 2892C1286BF4;
	Wed,  3 Jan 2024 08:19:18 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 8lk2WN7pnn28; Wed,  3 Jan 2024 08:19:18 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1704287957;
	bh=OWnU8kC5wLl9ctH/HNAKIYvqu9XdGQ8M1cPGVtVU4rQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=S3eYO+Z8CKwW1IE9p/acrOSyCffuhnfdq9tJpz65bsKYtIek47zu8GAbgMn/esirS
	 /Q1Kc8vdzKdFlOnd/Qz/8Lna//PoM8/5jtthUSHjtXkxKM08PoRJEXI0aDwwif5/oc
	 i/x4FwXETTP2KEFggVh+8PJ7eeYwIft5c3vmeVPc=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id CE3C71286B3E;
	Wed,  3 Jan 2024 08:19:16 -0500 (EST)
Message-ID: <f8d3ddc69bd95bc8553b5908523e55e0be245e84.camel@HansenPartnership.com>
Subject: Re: b4 modifying Cc-tags
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Pali =?ISO-8859-1?Q?Roh=E1r?=
	 <pali@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users
	 <users@linux.kernel.org>, tools@linux.kernel.org
Date: Wed, 03 Jan 2024 08:19:15 -0500
In-Reply-To: <CAMuHMdXxzhddGOoxXLxNoyHX2NnLad2PRz9V1sGd_or6UWFkMA@mail.gmail.com>
References: 
	<CAMuHMdVGqTM08DvsAjZ45wn1HTR0Grh8Ewj9q21pPwJmbok5hw@mail.gmail.com>
	 <CAMuHMdVhyjjcyxMAGF8rAqmyqin=xjWH0fhhOjqbq7rH4f-RNw@mail.gmail.com>
	 <20240102-axiomatic-gabby-whale-48d3bb@lemur>
	 <CAMuHMdVtCfkLCb=d59XDELJO53jXJmo03iLcCwvMq54BFiUpFA@mail.gmail.com>
	 <20240102-calculating-purple-dogfish-f4408c@lemur>
	 <CAMuHMdW7+ENssXG4aim-Oa0T1pH-i5-YhVB9C+JaFoJjzuQK4g@mail.gmail.com>
	 <20240102-debonair-beautiful-capybara-afced1@lemur>
	 <20240103004415.42xndtocu2ggr2a5@pali>
	 <CAMuHMdXxzhddGOoxXLxNoyHX2NnLad2PRz9V1sGd_or6UWFkMA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2024-01-03 at 13:26 +0100, Geert Uytterhoeven wrote:
> Hi Pali,
> 
> On Wed, Jan 3, 2024 at 1:44 AM Pali Rohár <pali@kernel.org> wrote:
> > On Tuesday 02 January 2024 15:49:45 Konstantin Ryabitsev wrote:
> > > On Tue, Jan 02, 2024 at 06:03:44PM +0100, Geert Uytterhoeven
> > > wrote:
> > > > > Overall, I would suggest that whoever is responsible for
> > > > > linux-m68korg sets up all the bits required by the modern
> > > > > email delivery stack (DKIM, SPF, DMARC).
> > > > 
> > > > That would be me (partially ;-)
> > > > 
> > > > Looking at linux-foundation.org, I guess that means adding a
> > > > TXT record with
> > > > 
> > > >     "v=spf1 include:_spf.kernel.org include:_spf.google.com
> > > > ~all"
> > > > 
> > > > + whatever outgoing servers the users of linux-m68k.org are
> > > > using?
> > > 
> > > That wouldn't be sufficient, because setting SPF by itself won't
> > > really do anything without DKIM signing as well.
> > 
> > Is not it really sufficient to have at least one of them? Because
> > these things are different.
> > 
> > SPF in DNS zone specifies which IP addresses are allowed to send
> > emails from that DNS domain. DKIM is a signature in the email
> > header, signed by the private key and reference to public key is in
> > the email header. Reference can point to any DNS domain. Also in
> > email header can be more DKIM signatures (e.g. if email is going
> > throw more email servers and every one signs email). So basically
> > these techniques are orthogonal to each other.
> 
> That was my understanding as well...
> 
> > I would recommend you to at least try to setup SPF into your DNS
> > zone and see if it improves situation or not. In the worst case you
> > would have to revert setup back.
> 
> I could do that, after obtaining a list of all outgoing email servers
> used by all linux-m68k.org email users...
> E.g. I use Gmail, and my ISP's SMTP relay for sending patches
> (I did set up an app-specific password for using Gmail's SMTP relays,
> but last time (long ago) I tried, Gmail always replaced the address
> in the From: line by the default address configured in Gmail,
> breaking other addresses and any "+<sponsor>" additions).

Technically if you're going to do SPF like that, you can also do DKIM,
you'd just have to distribute the DKIM key to everyone who uses the
server (or more likely, give each one their own DKIM key and label
which means you can revoke if one leaks).  Each sender would have to
run something like their own opendkim instance, which adds complexity
on the transmitting end, but it is possible.

But I have to say, all this is much easier if your mail domain has its
own system for both sending and receiving.  They're not usually that
expensive (tens of dollars a month) and there are lots of people on
this list who still run their own email servers, so there's a wealth of
technical expertise here to help you.

James


