Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D206C1BC5C
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 14:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760540153; cv=none; b=uAl1jrdOy9aJp2y1dGcYByoJDoM/wNIF4cqjvm+zshA8SsPYfi/lg9+X9i0kwaRFTqIEm605+Q8TUEpWM5l7dBVCu0hJJeg2oUloOjCLxkacPbv8YvMmXTINZZ7Fh0GGHH1T0XPk5WXsvhJBOnUgzrByZUIY2KJe/wsuZ2tqWzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760540153; c=relaxed/simple;
	bh=6AbvG2VpRTKG7q5ZXa/Q1NJyecRpgeQZowCbWDp3dtA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gi167foPJ26gsT+7h0F/eaTVTqZFQUKrccG1C73pQZDqJ+fG0cganUg2Xd1lF5GtUcQ7P0toYxr+YV8PC9ot6ehrGQ7pyfD6fr+a1mYJZRJX5/hZoHyFIjMmGjTgaVWpNRRCpB/+0V83hBtnUpx1LJMb3j5+gYG7cBOqsSBQx28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 212C311861E;
	Wed, 15 Oct 2025 14:55:43 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id E4AD220030;
	Wed, 15 Oct 2025 14:55:40 +0000 (UTC)
Date: Wed, 15 Oct 2025 10:55:48 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Linus Torvalds <torvalds@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 users@kernel.org, tools@linux.kernel.org
Subject: Re: [workflows]Re: In defense of Link (was Re: [b4] initial "b4
 dig" to supplant Link: trailers)
Message-ID: <20251015105548.3e19f04f@gandalf.local.home>
In-Reply-To: <20251015-zealous-debonair-bonobo-575799@lemur>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
	<20251013081536-mutt-send-email-mst@kernel.org>
	<CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
	<CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
	<yq1qzv49yb6.fsf@ca-mkp.ca.oracle.com>
	<20251015-zealous-debonair-bonobo-575799@lemur>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 9ae36ihooj8jutgqd1osntsw9ofcttkj
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: E4AD220030
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/Zx52nn/U1jfq6x1WxBm+fcFc2kCugL6g=
X-HE-Tag: 1760540140-137810
X-HE-Meta: U2FsdGVkX1/wpUzUIfh5YnOvMc7fjNyihjyWrCrvSLRbxs39A4FaziCGidcy478hy6BLLy1WgFmHFNFq+TOc3SKFvhUO8OUd2y6F4ZFcDXWVbpEx4L1JVKwflvDualWYSUmzwe7CNEg9zzNaTvjYmLsfijMiiwaTBOBIqQcN7bePlSU3ocLkekTGh4eT9DgQ8vagtmTK3pa9fWAtNk0pEGXLdhpZ/xQLOoSWQPdJ5GQ1xj3wUbyETElOYsTF2JgeqZG8VFWoh3ZwyPX3kRLzDEUOKJQun/RRjgPonsn8qZZdHKvwagAN4MCbsgRNQQ5/0RVQFBqWTd2bOT7H0jGoYdOoeNTKShkq7F28Pxtj+1zHMibvNGHtHWheL10x2yO8

On Wed, 15 Oct 2025 10:16:37 -0400
Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> On Wed, Oct 15, 2025 at 09:51:20AM -0400, Martin K. Petersen wrote:
> > With the edits I regularly do to fix typos, add line breaks, or
> > otherwise fix formatting, the effective patch-id hit rate is much lower.  
> 
> Do you normally edit them before applying, or after, when they are already
> applied to a tree?
> 
> > Exactly. So far, 'b4 dig' has not been able to identify very many
> > patches that weren't found via patch-id because of mismatched subject
> > lines.  
> 
> Linus would argue that in this case a Link: is warranted. :)

But knowing to add a link in this case is the hard part. My scripts add a
Link tag automatically. In most cases its useful because it helps with the
daisy chain of a patch. But in those small cases where the first patch gets
accepted, the Link tag added here is "useless" according to Linus. But I
still add it because my script does and I don't even think about the link
tags.

-- Steve
