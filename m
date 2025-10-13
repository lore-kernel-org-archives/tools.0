Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95273081CC
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367586; cv=none; b=mO3eEYTNvj/5nVmPXEkeM6jBWdTrLGSOSCkeqPOlynstyEPVqPOCFpAKGaX5bYZ+iyDSWDTlQHIH5U+13upgpyozDjFRZ4tWzVYqao8h6zffJKbwB+nwinhrKmJHMKKpkQUETk8k+6M4fBdP9YOpyl307gFNXwm2A+BuhIg1ajc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367586; c=relaxed/simple;
	bh=h+D4Jm/u3mP4asW5i0ZaAtVHMEmJE3vT6mz0il4gDgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QRrjU0yy056GE6jhrMwumAzimt3uKzfCOrLMipyUEORfgmmV2+4OI9sd7x4MYhV2sg8An8hRoHOQz3JbldR71DzG3pQxaFvHHVRBCfv35VIPtc3HbSFt8o5IEpQcrEqfGPFY2Y+yFT+6GqxryxTZZhklhx9Uim/cXwA6rmroj+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 1BCF713B268;
	Mon, 13 Oct 2025 14:59:36 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id DD65E2F;
	Mon, 13 Oct 2025 14:59:33 +0000 (UTC)
Date: Mon, 13 Oct 2025 10:59:36 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Willy Tarreau <w@1wt.eu>, Jiri Slaby <jirislaby@kernel.org>, Paolo
 Bonzini <pbonzini@redhat.com>, "Vlastimil Babka (SUSE)"
 <vbabka@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Mark Brown
 <broonie@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, users@kernel.org, tools@linux.kernel.org
Subject: Re: [workflows]Re: In defense of Link (was Re: [b4] initial "b4
 dig" to supplant Link: trailers)
Message-ID: <20251013105936.6ade84bd@gandalf.local.home>
In-Reply-To: <20251013143959.GA1168@pendragon.ideasonboard.com>
References: <20251011061351.GB23024@1wt.eu>
	<aOoyhUzNDgwiyl5s@finisterre.sirena.org.uk>
	<20251012232725.GC3938986@ziepe.ca>
	<d884ec6d-856c-4dce-b8bf-cb6116c87bcb@kernel.org>
	<CABgObfaL1Pki1QCgO_vb1Ex_1=RgVwzOmD8Z+q_KnPw3jHwBpQ@mail.gmail.com>
	<20251013084211.GH616@1wt.eu>
	<d4f8e576-ee8c-4b74-a260-78289a26ec07@kernel.org>
	<20251013085629.GK616@1wt.eu>
	<20251013112159.GJ29493@pendragon.ideasonboard.com>
	<20251013102628.2f9e0057@gandalf.local.home>
	<20251013143959.GA1168@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: oqc3tt4hoozik6kgofccx7ppu9eon363
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: DD65E2F
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+F4/Q1b7YhUBLyPap82SzvLxvcxyEp24I=
X-HE-Tag: 1760367573-640286
X-HE-Meta: U2FsdGVkX19Pv09bCU8EwwFwHHChCuyUmTktz3gYlr/HClqVT4l3o5uylBvj4Q4J9HUfc9od4Jr2eJAA2JBUwSZil1B5X10HlqZ9R5fBwdg1w4dLqOFxrCL3JvH8WT6Jf+VmOTk0Ko5vIf9TkmWdyHhQLOf02WnXFrkNTiR1vygsR5XpSku2ZMBSrpeqT5hFnE8LmrnRgOA2fkUDs3rjO+ORz83n4Dbld+Ar1HSZ6NpLjNKX4z+C5vC6QnA3O8wUOeKsH2KBLignr7rD8+qLFbyHRAfLhJjgWZ07US6xff2bLVk3lpqczFxzG5assYnJK8gDNqdDKD3jjYkrcu9JeRIkkgBayek1ZpjkUR6AuB7MXZgVu2Jow07YybpPHjvFTxqEA4qFjWzI02l2myoP+g==

On Mon, 13 Oct 2025 17:39:59 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Using Link: for this will not work well as soon as you need multiple
> links. Compare the following (edited with made up information) commit
> message with
> 
>     Remove the HAVE_FTRACE_MCOUNT config and use DYNAMIC_FTRACE directly where
>     applicable. This has shown a 50% improvement in CPU usage.
>     
>     Link: https://lore.kernel.org/all/20250703154916.48e3ada7@gandalf.local.home/
>     Link: https://lore.kernel.org/all/20250703140000.deadbeef@gandalf.local.home/
> 
> with
> 
>     The HAVE_FTRACE_MCOUNT config was reported as being reduntant ([1]).
>     Remove it and use DYNAMIC_FTRACE directly where applicable. This has
>     shown a 50% improvement in CPU usage ([2]).
>     
>     [1] https://lore.kernel.org/all/20250703154916.48e3ada7@gandalf.local.home/
>     [2] https://lore.kernel.org/all/20250703140000.deadbeef@gandalf.local.home/

I'm fine with replacing link with normal reference tags for human
discussion purposes. As I add them manually anyway, that doesn't make a
difference to me.

But the main issue here is that if we get rid of the Link: tag to the
submission, it will totally destroy my workflow. So much so, I'll just stop
doing the daisy chain references.

-- Steve
