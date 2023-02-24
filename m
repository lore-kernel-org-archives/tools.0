Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7191E539D
	for <tools@linux.kernel.org>; Fri, 24 Feb 2023 14:11:24 +0000 (UTC)
Date: Fri, 24 Feb 2023 14:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1677247881; bh=u3VhVKLHvvxQKWodoGTa+ZPNS6WoXaVMAPu10yndKWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lJtfJ00eMweuXZmNjuRABwpHskkBdLZ4x4Mqjb8zfqhcGU5C3vWUeN0uInQ6tYn4t
	 6WVKQeppFbRAYKXXMFHw4wRns5lQ17ZOXKCYqA3xJ3pn41PyCGMvE6No3v8/9DCbbV
	 qPhf5CXDQF+NKAMxXiqWb3oe5OFGq//h0DzxpL3s=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@linux.kernel.org>
Subject: Re: [BUG] message header mangling on vger.kernel.org and
 lore.kernel.org
Message-ID: <22cc4392-561d-416b-aae6-d0f8dc32eb8d@t-8ch.de>
References: <a997d239-2678-45bb-8f18-7780409a5013@t-8ch.de>
 <20230223211815.3uzacmodoo5amfnu@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230223211815.3uzacmodoo5amfnu@meerkat.local>

On Thu, Feb 23, 2023 at 04:18:15PM -0500, Konstantin Ryabitsev wrote:
> On Thu, Feb 23, 2023 at 08:56:45PM +0000, Thomas Weißschuh wrote:
> > Hi,
> > 
> > I tried to "b4 shazam" one of my own patches from lore for which the
> > DKIM check failed.
> > Further investigation revelead what seems to be modifications of message
> > headers by both vger.kernel.org and lore.kernel.org.
> > As this affects DKIM-signed headers the validation fails.
> 
> This doesn't really have much to do with b4, it's just a known aspect of vger
> -- it does not do "simple/simple". To make your mail setup work with vger, you
> should change it to "relaxed/simple".
> 
> I go into reasons and details in this post:
> https://lore.kernel.org/lkml/20211214150032.nioelgvmase7yyus@meerkat.local/

Thanks for the pointer, I even read that mail back then...

It's now fixed on my side.

Sorry for the noise,
Thomas
