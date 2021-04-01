Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DE55F;
	Thu,  1 Apr 2021 17:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id D7EDD1280351;
	Thu,  1 Apr 2021 10:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1617296855;
	bh=RcOicdzG00d8Sm7Y5g22J9Qxq7Kj/ZNv8g6V8BuP9Ws=;
	h=Message-ID:Subject:From:To:Date:From;
	b=poPypEwZaJAqFRCiGDO1JIoMTtREjWg8cBgPEZsAdhVRHyHYkAP53IqKfCRcXhZHt
	 oL985saggq+WMiJ2S071Cfvy+zJKSFH4LfjUu6T+IQGl34rWLMyNpcN2qfEiRRW4Lz
	 RkR+SxdeLkUbiqXp5w5e7zB7dYN/dEGj6IVpTN3w=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5GDoXIHPaV0W; Thu,  1 Apr 2021 10:07:35 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id A05F01280338;
	Thu,  1 Apr 2021 10:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1617296855;
	bh=RcOicdzG00d8Sm7Y5g22J9Qxq7Kj/ZNv8g6V8BuP9Ws=;
	h=Message-ID:Subject:From:To:Date:From;
	b=poPypEwZaJAqFRCiGDO1JIoMTtREjWg8cBgPEZsAdhVRHyHYkAP53IqKfCRcXhZHt
	 oL985saggq+WMiJ2S071Cfvy+zJKSFH4LfjUu6T+IQGl34rWLMyNpcN2qfEiRRW4Lz
	 RkR+SxdeLkUbiqXp5w5e7zB7dYN/dEGj6IVpTN3w=
Message-ID: <13b77ad8f00b5590baca6203cc7b073df477e993.camel@HansenPartnership.com>
Subject: Lore link problems with lossy lists
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: users@linux.kernel.org
Cc: tools@linux.kernel.org
Date: Thu, 01 Apr 2021 10:07:34 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

I notice that if you pull up the folio patch by message id:

https://lore.kernel.org/r/20210331184728.1188084-1-willy@infradead.org

It pulls up the linux-fsdevel version of the patches:

https://lore.kernel.org/linux-fsdevel/20210331184728.1188084-1-willy@infradead.org/

But that version is incomplete, thanks to vger being lossy again. so
you don't see any replies to Christoph's email

Whereas if you do s/fsdevel/mm/ in the above URL you'll get them.

I get that this is a problem with multiple lists and wouldn't exist if
vger were functioning normally.  However, lore must know there are
replies that should be on the list it gave you ... it would be helpful
if it at least gave a hint that it has the replies, even if not on the
chosen list.

Put more broadly: when pulling up a thread by messageid, could we get a
redirect always to the entire set of replies lore has even if they
traverse multiple lists ... forget the lossy list problem, annoying
people drop and add various lists from CC's all the time, but in spite
of this I would like to be able to see the full thread.

James


