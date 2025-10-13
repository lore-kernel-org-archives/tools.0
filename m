Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E18B224B05
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 14:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760366573; cv=none; b=gBBQNMyXf92HFGhXCCuMyOIUxrRllZws9tzafnK8IYljX82L+5Z43gZ5bdGYUAXiyLlNgwDve4a10rq70NS8RfCMI2zo96lXGzyFQ9dO0serGKM1GxNPTaePyJSHr+YILA+8b0/4LmMuJBlcCrcom1AFsGIGTqxocpJQoV1UAGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760366573; c=relaxed/simple;
	bh=c5e8qRfs5j4bLL92ZfYooz5vjzV8dn0HCdBtOzG5sDE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VtxTdcMyO968ZVSfMJr2OOS9hH+jqAjUc/I6Ip8oGFyZeMNYP4WuxAQltP/rpuAMp2HbOvhNST5GtIla58tPVKfM83/hXce1XCVoCAr5ZrMNv43p/03LUBzeiETcuOigThnnb53GPIrGfQv5qewkG3VNQZDzwhryvLA1Ro+nEFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id A948711A302;
	Mon, 13 Oct 2025 14:26:27 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id 75F132000D;
	Mon, 13 Oct 2025 14:26:25 +0000 (UTC)
Date: Mon, 13 Oct 2025 10:26:28 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Willy Tarreau <w@1wt.eu>, Jiri Slaby <jirislaby@kernel.org>, Paolo
 Bonzini <pbonzini@redhat.com>, "Vlastimil Babka (SUSE)"
 <vbabka@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Mark Brown
 <broonie@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, users@kernel.org, tools@linux.kernel.org
Subject: Re: [workflows]Re: In defense of Link (was Re: [b4] initial "b4
 dig" to supplant Link: trailers)
Message-ID: <20251013102628.2f9e0057@gandalf.local.home>
In-Reply-To: <20251013112159.GJ29493@pendragon.ideasonboard.com>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
	<20251011061351.GB23024@1wt.eu>
	<aOoyhUzNDgwiyl5s@finisterre.sirena.org.uk>
	<20251012232725.GC3938986@ziepe.ca>
	<d884ec6d-856c-4dce-b8bf-cb6116c87bcb@kernel.org>
	<CABgObfaL1Pki1QCgO_vb1Ex_1=RgVwzOmD8Z+q_KnPw3jHwBpQ@mail.gmail.com>
	<20251013084211.GH616@1wt.eu>
	<d4f8e576-ee8c-4b74-a260-78289a26ec07@kernel.org>
	<20251013085629.GK616@1wt.eu>
	<20251013112159.GJ29493@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: gk99wdwqgbe6ss8zbfou431ectnsggty
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 75F132000D
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/E76ZV+W8qWcjB7PXRkGephvG9oHHgRsk=
X-HE-Tag: 1760365585-339129
X-HE-Meta: U2FsdGVkX1+n7OPtEKU6F66hr9P87sL9gdEfiIhXIOrcATde87vQYfOP3NFcxPF9CzbjM60xqvsv0X2jPf4Fjs2C34+agS4/pFbrBQ+HbUYAl/Adgj0e1L2lN14ND7ZihSKBTsfsOT47ihtROV9eISioBiW+s6Wit22SEh6we6pHBlKnUqHe9o4OqOQ20hR3/WlNdJxkZlrg5/umoOczRZ4w+FVN9/IsG/TM7dDOTDwJaa1jrVV/7+NMLp8sTV8hcFdhO/NpweQppklJneKgiLGlW2RDqufV8VIY2Z6fprk4yyOjnqsWda26qdA1l4VRHSV4CTDF59BfozBu9wviz1D+rFSoOFnFZXub8W+FdsoT/ChDqhNtoPmZyTsHRSK76rcZJlVqBbuVh5pqfv6w4SVjo3++rklEam7ZMkUIp7hX/48R4eCqGQlfybQg81ta7W+o1NvcjS9o+FqkOZ2GC7X+A8Omcb7JpHuFoz7Pz4fhSVxvm0/dq3EHAVZWeeX5JXHR8f+gK6J8DmbzrEE7RiYMiVvqdojT0s97raVwXiG7gN1VUmkYiAzcPNFvfBa/40L+8sdGaOMz7qRNwJutNdrq8JgCMDpgX2qdfGVLliGPAc/pOOHzuL+Lw0yHr2ugRHpCofgKcEA=

On Mon, 13 Oct 2025 14:21:59 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> I may be missing something obvious, but why do we need a trailer for
> this kind of usage ? We've added links to commit messages for ages,
> either embedded in the text, or with "footnotes" (i.e. [1]). One of the
> advantages of standardizing trailers is that they can be parsed by
> scripts. I see few use cases for automating retrieval of a paper
> explaining the background. Footnote links would seem better suited for
> links that support the commit message, as they can then be referenced
> from a specific place in the commit message. That would free usage of a
> Link: trailer for other purposes.
> 
> [1] This would be a foot note link

I do something pretty much like this. Like others here, my scripts
automatically add the submission link to the tag section. But if there's
ever a conversation outside the patch submission that lead to the patch
itself, I place the link tag separate from the rest. As to me, the tags
section is for automation, but everything above it is for humans to read.
Hence, you'll see commits like this one:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4d6d0a6263babf7c43faa55de4fa3c6637dec624

Where it has:

    [..]

    Remove the HAVE_FTRACE_MCOUNT config and use DYNAMIC_FTRACE directly where
    applicable.
    
    Link: https://lore.kernel.org/all/20250703154916.48e3ada7@gandalf.local.home/
    
    Cc: Masami Hiramatsu <mhiramat@kernel.org>
    Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
    Cc: Mark Rutland <mark.rutland@arm.com>
    Cc: Linus Torvalds <torvalds@linux-foundation.org>
    Link: https://lore.kernel.org/20250704104838.27a18690@gandalf.local.home
    Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

The first Link outside the text section was the motivation for the patch,
and the Link in the tag section is for the patch.

Now that second Link is also useful, because if any of my patches have
versions, I always have a link to the previous version in the last version.
For example:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=71753c6ed2bf2aee5be26c1bc06a94c9e3713ade

Which has the committing link:

  https://lore.kernel.org/all/20250729182404.975790139@kernel.org/

Which has:

  Changes since v15: https://lore.kernel.org/20250725185739.233988371@kernel.org

So it allows you to not only find the cover letter of a series, but also
daisy chains all the links to previous versions so you can see how the
patch was developed, and all the comments to the older versions.

Now my workflow incorporates these link tags. When I need to create a new
version of the patch, I save the old git branch with its version:

  git branch topic-v1
  git reset --hard <base-commit>

Then I download the old version from patchwork, run my scripts to pull it
in (which adds the links to the emails of those commits). And when I make the
next version, I record the changes by replacing the:

  Link: https://lore.kernel.org/...

With

  Changes since v1: https://lore.kernel.org/...

And before sending my emails, I move that text below the '---'.

And this makes it very easy to incorporate the daisy chain. If I have to
use any external tooling to search for it, I'm not going to bother, and
this workflow will just stop happening.

-- Steve


  
