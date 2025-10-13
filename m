Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0233093DD
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 15:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367850; cv=none; b=ZuWNIM8009VvnHBy7hQKJbY7/A4L+etucopir31u0aCI4IOfkp4q4d8oIRT0Iq+uvZJzecvxtKPvgWJAmjve9b7rW1gaQiv5kEBIsdt57dmd3g/3jJJJ38RmQa2EPZEWVg6ulKa5N3XWMn/gIQMnnmDYnR4tqWElnahGVIeK5Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367850; c=relaxed/simple;
	bh=Rbnb8cAjsw7Kd9TVk+syDivzuCCZ5yISo0cZJQQeY/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fGMUPBUu/i3CXYrLSrSTUxFkZ9cKkc4T6XYOD5VuATl/8c5qXSMSXMMKJlxca2roQ8d0iZnS+E0QUDlKowXwhSSbqoN3AkGHqU059WIwAiCGP+8c3dxBR5dZGmSnxiI4sqwSwmDGyRRaUpaw3bGwvwlVPZuJza9LzVD7VS4AoCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qQccfaWU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qQccfaWU"
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0F847557;
	Mon, 13 Oct 2025 17:02:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760367750;
	bh=Rbnb8cAjsw7Kd9TVk+syDivzuCCZ5yISo0cZJQQeY/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qQccfaWUOxKwVxJ3EDJaTxT+aOnpNren7YBHmcq1f7SexftlLlAp6B14V9i16UCqd
	 ukUX5YxEhbWt1g2U5DPVOU+dU6ERi2jvQ7eFx2stVFRwKykhO/pPXAGRRxma9XRMMY
	 5YqAApIy6fa0kKmdbFaHjRadmmkBemxmxSgp5ZV8=
Date: Mon, 13 Oct 2025 18:04:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Willy Tarreau <w@1wt.eu>, Jiri Slaby <jirislaby@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mark Brown <broonie@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@kernel.org, tools@linux.kernel.org
Subject: Re: [workflows]Re: In defense of Link (was Re: [b4] initial "b4 dig"
 to supplant Link: trailers)
Message-ID: <20251013150401.GA6599@pendragon.ideasonboard.com>
References: <20251012232725.GC3938986@ziepe.ca>
 <d884ec6d-856c-4dce-b8bf-cb6116c87bcb@kernel.org>
 <CABgObfaL1Pki1QCgO_vb1Ex_1=RgVwzOmD8Z+q_KnPw3jHwBpQ@mail.gmail.com>
 <20251013084211.GH616@1wt.eu>
 <d4f8e576-ee8c-4b74-a260-78289a26ec07@kernel.org>
 <20251013085629.GK616@1wt.eu>
 <20251013112159.GJ29493@pendragon.ideasonboard.com>
 <20251013102628.2f9e0057@gandalf.local.home>
 <20251013143959.GA1168@pendragon.ideasonboard.com>
 <20251013105936.6ade84bd@gandalf.local.home>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251013105936.6ade84bd@gandalf.local.home>

On Mon, Oct 13, 2025 at 10:59:36AM -0400, Steven Rostedt wrote:
> On Mon, 13 Oct 2025 17:39:59 +0300 Laurent Pinchart wrote:
> 
> > Using Link: for this will not work well as soon as you need multiple
> > links. Compare the following (edited with made up information) commit
> > message with
> > 
> >     Remove the HAVE_FTRACE_MCOUNT config and use DYNAMIC_FTRACE directly where
> >     applicable. This has shown a 50% improvement in CPU usage.
> >     
> >     Link: https://lore.kernel.org/all/20250703154916.48e3ada7@gandalf.local.home/
> >     Link: https://lore.kernel.org/all/20250703140000.deadbeef@gandalf.local.home/
> > 
> > with
> > 
> >     The HAVE_FTRACE_MCOUNT config was reported as being reduntant ([1]).
> >     Remove it and use DYNAMIC_FTRACE directly where applicable. This has
> >     shown a 50% improvement in CPU usage ([2]).
> >     
> >     [1] https://lore.kernel.org/all/20250703154916.48e3ada7@gandalf.local.home/
> >     [2] https://lore.kernel.org/all/20250703140000.deadbeef@gandalf.local.home/
> 
> I'm fine with replacing link with normal reference tags for human
> discussion purposes. As I add them manually anyway, that doesn't make a
> difference to me.
> 
> But the main issue here is that if we get rid of the Link: tag to the
> submission, it will totally destroy my workflow. So much so, I'll just stop
> doing the daisy chain references.

My point was that, if we don't use a Link: trailer for human discussion
purpose, we could reclaim its usage for automation. The two problems are
somehow distinct but related, what triggered me was that a large part of
the discussion was based on the assumption Link: should be used for
human links, while I find that usage counterproductive.

-- 
Regards,

Laurent Pinchart
