Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7603090CE
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 15:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370282; cv=none; b=F8AAkcWP7PTzWMVbeTpEKktkhBXMdoao6CVGND6KN/Sioz5atXjXceZs+6vzx/Ql80NzP9vzhjSGq/9h8234x7G9cu9VoXz0XmbEQH8PBRZCjebhi9HfnLmvrLZBKBCwBz1Wr90MmuQ3sTCbt5RNCWUNO18//Obhyku/kKhTpIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370282; c=relaxed/simple;
	bh=OF7zO/E8GCwwO+eA0AzSayLD3RGJ533UTJsc5TtPCjI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jcTpPha5Ajx2QRELc8Uv1JCcsPxSppOm0jKyMn+8mXyHM4RMnZj4TYl0oYaDAbA7kEvaz/+HgZEYdeKZ8pOn2XwDFQbVVC/OswfG7td0p7I6PmFHOMMGfVRFoLSjHJOgIvJzYJ3mMby8Dbtxiv3TSuuO9qV7FzK3emDUOw4Yiuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 2E25614052C;
	Mon, 13 Oct 2025 15:44:38 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf20.hostedemail.com (Postfix) with ESMTPA id DAE9120025;
	Mon, 13 Oct 2025 15:44:35 +0000 (UTC)
Date: Mon, 13 Oct 2025 11:44:39 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Willy Tarreau <w@1wt.eu>, Jiri Slaby <jirislaby@kernel.org>, Paolo
 Bonzini <pbonzini@redhat.com>, "Vlastimil Babka (SUSE)"
 <vbabka@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Mark Brown
 <broonie@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, users@kernel.org, tools@linux.kernel.org
Subject: Re: [workflows]Re: In defense of Link (was Re: [b4] initial "b4
 dig" to supplant Link: trailers)
Message-ID: <20251013114439.118aaeb1@gandalf.local.home>
In-Reply-To: <20251013150401.GA6599@pendragon.ideasonboard.com>
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
	<20251013150401.GA6599@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 58migq1btirq5feeshropsrraidysnxo
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: DAE9120025
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+BYp1ELILq5I2pgfnpJlN57j6XxOJyVuo=
X-HE-Tag: 1760370275-41414
X-HE-Meta: U2FsdGVkX19URxC8B71YMk2JWS7MPFdbTp0E62LAK6sVZgeNPGvAWlgx+fOVCAeqePzkxD+BVfUnSxrV0AmwSliAdegRfre5RVuPlZ1fxEgTKBHxrGez0fO9YkdZVSWlC23Nzk5itHIPlubn0zxNqqBHGrnRGsO/BVfH0MxygScymfZ4CMhmds8nIHRIeig/ePZ8Qt/X+EXsDhNG+nGl2db7HqAG3lqq0MntygTXgfJdPAnfZeydZxLESVlIdqt6zhmn2mptM36gi+rqE5NYJqtRVaECUxi+O/bhlE+owTt7u3oUKYpk5zPbd4WW+tInh8XezZIXqxoMnP8rtqtQ9UmfS9n+8aZK8NJ/XS0WalgodNPlq8KjlOSVSjqORwnL

On Mon, 13 Oct 2025 18:04:01 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> My point was that, if we don't use a Link: trailer for human discussion
> purpose, we could reclaim its usage for automation. The two problems are
> somehow distinct but related, what triggered me was that a large part of
> the discussion was based on the assumption Link: should be used for
> human links, while I find that usage counterproductive.

I totally agree.

-- Steve
