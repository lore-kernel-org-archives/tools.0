Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2647F72;
	Wed, 14 Apr 2021 00:02:32 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 498F961242;
	Wed, 14 Apr 2021 00:02:31 +0000 (UTC)
Date: Tue, 13 Apr 2021 20:02:28 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder <elder@ieee.org>,
 users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: RFC: Superseded-by: follow-up trailer
Message-ID: <20210413200228.2b41e244@gandalf.local.home>
In-Reply-To: <20210413214031.fenjvgh5helyuqdz@nitro.local>
References: <20210413204932.yovoa7njwc56jo5v@nitro.local>
	<fd732fc9-83a9-5502-fba5-f08317bdcaf3@ieee.org>
	<CAHmME9pFqm00ibpqhQQ9_P61F7mU12yrcOvdNSDYDz8ot8HJDg@mail.gmail.com>
	<20210413172901.1465307c@gandalf.local.home>
	<20210413214031.fenjvgh5helyuqdz@nitro.local>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Apr 2021 17:40:31 -0400
Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> I'd rather folks used the following notation in the cover letter/patch
> basement:
> 
>     Previous versions:
> 
>     Link: https://lore.kernel.org/r/foo # v2
>     Link: https://lore.kernel.org/r/bar # v1
> 
> This is much more succinct, indicates the version number in the trailer, and
> removes the need to remember how to spell "Superseded", as there seems to be
> little consensus. :)
> 
> The tooling on the kernel.org side can automatically send the required
> follow-ups to previous threads when it finds these trailers in newer
> submissions.

Sounds good.

-- Steve
