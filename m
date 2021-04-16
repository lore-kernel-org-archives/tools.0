Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E66F29CA;
	Fri, 16 Apr 2021 21:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 36FCD1280544;
	Fri, 16 Apr 2021 14:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1618608179;
	bh=HTafy4e+GSJqtI7p7iMN1ZzhJHFpizp9hDmmnnK5ZIU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=je2lyImGRptNzo3I0z/aTLZtxCFEu9UvcKcvyt/MyPREIoLMxRVjvYqdTEG36tNwp
	 pOAMWaGl+xJYNgXeZ55ivO/YWlDIBsi/YdzQSkgrphwSymzdqnYSzi3NMRvHeQig/o
	 g3pHiaUtdXNYGZsqQV9J5fSwENb2CAvNWHl8bPDU=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7H7dSgzQu9YR; Fri, 16 Apr 2021 14:22:59 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id BED691280541;
	Fri, 16 Apr 2021 14:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1618608178;
	bh=HTafy4e+GSJqtI7p7iMN1ZzhJHFpizp9hDmmnnK5ZIU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=G0MEWUxLku1yqXGB1MKIH4Kn2FFxXmE5KKv6aRJ6JUQqomu44MfBZESaKy4D0mUU8
	 DYGw1Bm8SpkrLJwZ2cZ0l50t5oQqk0I8eQd+8YlIH4afbXvfouZNi3MuOqks5aOEuj
	 GiE9M076kRgqgCfHN2J+SYWjg/9Lr2hMY6cKESGY=
Message-ID: <7be28063b8fb355fe1e73df6ca8c4db5e2163353.camel@HansenPartnership.com>
Subject: Re: Subscriber actions for migrating lists to lists.linux.dev
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Date: Fri, 16 Apr 2021 14:22:58 -0700
In-Reply-To: <20210416211615.7serx3oa2rloe7al@nitro.local>
References: 
	<cd77ebe2e456cb80527d9634a5469254006528c5.camel@HansenPartnership.com>
	 <20210416211615.7serx3oa2rloe7al@nitro.local>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Fri, 2021-04-16 at 17:16 -0400, Konstantin Ryabitsev wrote:
> On Fri, Apr 16, 2021 at 01:58:22PM -0700, James Bottomley wrote:
> > I'm fairly certain all I need to do is a bit of duplicate message
> > elimination and to update my procmail rules, but on the latter,
> > what is the header I should be sorting on?  For current kernel.org
> > lists, it's either X-Mailing-list: or List-ID:  Will it be the same
> > for lists.linux.dev (so I just add to the domain in the rule)?
> 
> We still add both List-Id and X-Mailing-List headers, but as "List-
> Id" is an actual RFC standard, I suggest filtering based on that.
> E.g. for linux-staging@lists.linux.dev we add the following headers:
> 
>     X-Mailing-List: linux-staging@lists.linux.dev
>     List-Id: <linux-staging.lists.linux.dev>
>     List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
>     List-Unsubscribe: <mailto:
> linux-staging+unsubscribe@lists.linux.dev>
> 
> > Ordinarily I'd just wait and see, but given the volumes involved I
> > wasn't keen on waking up to hundreds of emails suddenly in my INBOX
> > instead of the list folders.
> 
> Note, that once we get around to vger lists, we'll be preserving the
> address and list-id without changes.

Thanks, I like hearing "you don't have to do anything at all".

>  The lists we're currently migrating are moving from other places --
> either from domains we don't control (lists.01.org), or from domains
> like lists.linuxfoundation.org where there are MLs that will likely
> not enjoy mlmmj-style list management and will move to groups.io
> instead after we cherry-pick the devel lists.

OK, so for ksummit-discuss and it's ilk I need

* ^List-Id: .*ksummit-discuss.lists.(linuxfoundation.org|linux.dev)

And I'll be good to go.

Thanks!

James


