Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA00E3FF0;
	Thu,  9 Sep 2021 15:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1631201069;
	bh=EDK3K3BZTl/sMhXstbIfmfP4aAA3qkHRBS9sDnG/vMY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=hdmltT2iMqmUsN9BT8J8X5qUYK+ELGthHkjUF68k9QdiQa0MpElJs90/uXLH5yfBJ
	 axUSWaQQnIqeel9iRteOsWB4UcULuoALlNVfa2rQebhFHLz4nO8BUAd86Xve5UPN4V
	 7EEh3vjf3qbfC2iwo3YWljao7MekjVhe4X0GpiEo=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id F14EB1280F71;
	Thu,  9 Sep 2021 08:24:29 -0700 (PDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aebtUG-Sb2e0; Thu,  9 Sep 2021 08:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1631201069;
	bh=EDK3K3BZTl/sMhXstbIfmfP4aAA3qkHRBS9sDnG/vMY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=hdmltT2iMqmUsN9BT8J8X5qUYK+ELGthHkjUF68k9QdiQa0MpElJs90/uXLH5yfBJ
	 axUSWaQQnIqeel9iRteOsWB4UcULuoALlNVfa2rQebhFHLz4nO8BUAd86Xve5UPN4V
	 7EEh3vjf3qbfC2iwo3YWljao7MekjVhe4X0GpiEo=
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 752221280F6F;
	Thu,  9 Sep 2021 08:24:29 -0700 (PDT)
Message-ID: <dc02087e09203a03c54c51dd3bfb09deb3cd9077.camel@HansenPartnership.com>
Subject: Re: New version of lore available for preview
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Lee Jones
	 <lee.jones@linaro.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masahiro Yamada
 <masahiroy@kernel.org>,  Jason Gunthorpe <jgg@nvidia.com>,
 users@linux.kernel.org, tools@linux.kernel.org
Date: Thu, 09 Sep 2021 08:24:28 -0700
In-Reply-To: <20210909143937.jgppakjxcig7dug6@meerkat.local>
References: <20210902195332.GA2493828@nvidia.com>
	 <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
	 <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
	 <20210903152143.nt5mzgwprltl36pa@meerkat.local>
	 <CAF2Aj3jbU_vnKvYB2EJXuKdTCeJx3dgZY2h7sriJX4fP6Fsteg@mail.gmail.com>
	 <20210908183746.iancht34j3drun77@meerkat.local>
	 <20210909084907.271b6df5@gandalf.local.home> <YToM6bH/I9rHQMeE@google.com>
	 <20210909133840.hezwxmojt4o6lm7o@meerkat.local>
	 <YToQEQPcjU5RUww7@google.com>
	 <20210909143937.jgppakjxcig7dug6@meerkat.local>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2021-09-09 at 10:39 -0400, Konstantin Ryabitsev wrote:
> On Thu, Sep 09, 2021 at 02:45:53PM +0100, Lee Jones wrote:
> > > b4 am -3 -s -o- msgid | git am
> > 
> > Ah yes, piping to stdout and straight into Git works great.
> > 
> > And with "-P _", it does exactly what I want.
> > 
> > Thanks for your quick response Konstantin.
> 
> No worries, and like I said -- if you actually need patchwork for
> tracking state, then we'll be adding a way to create search-based
> projects in the near future.

I thought public inbox had a mechanism for tracking local state: the
most pressing being whether you've read the message or not when you use
imap backed by public inbox.  Can't this local tracking be extended to
do other useful things patchwork previously did?

James


