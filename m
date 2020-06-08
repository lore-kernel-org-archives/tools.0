Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [66.63.167.143])
 by mx.groups.io with SMTP id smtpd.web12.64.1591637450053399452
 for <tools@linux.kernel.org>;
 Mon, 08 Jun 2020 10:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hansenpartnership.com header.s=20151216 header.b=xZH0Y1RO;
 spf=pass (domain: hansenpartnership.com, ip: 66.63.167.143, mailfrom: james.bottomley@hansenpartnership.com)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 8340D8EE2B2;
	Mon,  8 Jun 2020 10:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
	s=20151216; t=1591637449;
	bh=ShtQqb0JcsN+aurqeZpocdRMVZXh0OTyjY+HkkA2vwI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=xZH0Y1ROsJmLPO+34gIm/xmPbSAvxg9vjmQlhKO5SBjItAag957TZ/FbPmxobOU1P
	 ig91xbyZoUaTktL6KlHGAjL/THQywTsoAXxjipMyHli+8gI/bB8pNf0Row+f8lxtd3
	 upcXcTn8/33aKiaSLtM7ow20uHPML/ym0XD8pQfI=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yKrup6LKN-ic; Mon,  8 Jun 2020 10:30:49 -0700 (PDT)
Received: from [153.66.254.194] (unknown [50.35.76.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id CE5A18EE0EA;
	Mon,  8 Jun 2020 10:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
	s=20151216; t=1591637449;
	bh=ShtQqb0JcsN+aurqeZpocdRMVZXh0OTyjY+HkkA2vwI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=xZH0Y1ROsJmLPO+34gIm/xmPbSAvxg9vjmQlhKO5SBjItAag957TZ/FbPmxobOU1P
	 ig91xbyZoUaTktL6KlHGAjL/THQywTsoAXxjipMyHli+8gI/bB8pNf0Row+f8lxtd3
	 upcXcTn8/33aKiaSLtM7ow20uHPML/ym0XD8pQfI=
Message-ID: <1591637447.3500.15.camel@HansenPartnership.com>
Subject: Re: [kernel.org users] b4 version 0.5.0 is available
From: "James Bottomley" <James.Bottomley@HansenPartnership.com>
To: Linus Torvalds <torvalds@linuxfoundation.org>, Konstantin Ryabitsev
	 <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Date: Mon, 08 Jun 2020 10:30:47 -0700
In-Reply-To: <CAHk-=wipQzNyLxEh2mr2=Y9brLx_y0G0aKrVcjG2Ad3ba+_41Q@mail.gmail.com>
References: <20200525203341.z4dollmzbo7exnhc@chatter.i7.local>
	 <CAHk-=wipQzNyLxEh2mr2=Y9brLx_y0G0aKrVcjG2Ad3ba+_41Q@mail.gmail.com>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-06-08 at 09:59 -0700, Linus Torvalds wrote:
> Hmm.
> 
> This fails with the most recent patch-bomb from Andrew when I
> randomly
> picked the email (just because it was most recent in my mailbox
> because of a reply, not because of arrival), and I don't see why.
> 
> Doing
> 
>     b4 am 20200608044014.1sydER6sj%akpm@linux-foundation.org
> 
> gets me 51 out of 54 patches, and no cover letter. Strange.
> 
> But when I do the same on the _first_ message ID in the series:
> 
>     b4 am 20200608044004.04xI8ALrc%akpm@linux-foundation.org
> 
> it gets the whole series. It again doesn't find the base commit, but
> it's a lot better.

That's an akpm problem: you can see it here on lore:

https://lore.kernel.org/linux-mm/20200608044004.04xI8ALrc%25akpm@linux-foundation.org/

Lore says it can't find the cover letter because the In-reply-to has
the wrong message id.  This broke threading on my system as well.

James

