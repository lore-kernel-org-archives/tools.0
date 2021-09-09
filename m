Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782323FC8;
	Thu,  9 Sep 2021 12:50:59 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BBB3060ED8;
	Thu,  9 Sep 2021 12:50:58 +0000 (UTC)
Date: Thu, 9 Sep 2021 08:50:57 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: David Howells <dhowells@redhat.com>, users@linux.kernel.org,
 tools@linux.kernel.org
Subject: Re: lore.kernel.org upgrade: Sep 1, 2021
Message-ID: <20210909085057.26bd5b73@gandalf.local.home>
In-Reply-To: <20210909123150.fgo7vma4i32t36mg@meerkat.local>
References: <20210830164626.tq5emfrht4o46x33@nitro.local>
	<398626.1631181532@warthog.procyon.org.uk>
	<20210909123150.fgo7vma4i32t36mg@meerkat.local>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 9 Sep 2021 08:31:50 -0400
Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> On Thu, Sep 09, 2021 at 10:58:52AM +0100, David Howells wrote:
> > Would it be possible to get a search box on the front page into which you can
> > just drop a message ID and have it jump to the message, if present, kind of
> > like lore.kernel.org/r/<msg-id> does?  
> 
> You can make it even easier.
> 
> In Firefox:
> 
>     * open bookmarks pane (Ctrl-b)
>     * right-click->add bookmark
>     * Name: lore mid, URL: https://lore.kernel.org/%s, Keyword: lore -> Save
> 
> In Chrome:
> 
>     * Go to chrome://settings/searchEngines
>     * Click "Add" next to "Other search engines"
>     * Search engine: lore mid, Keyword: lore, URL: https://lore.kernel.org/%s -> Add
> 
> Now you can type "lore <message-id>" in the toolbar.

Thanks for the tip! I'll add this.

I also make all my email clients show Message-ID by default.

-- Steve

