Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1212C15B4
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 14:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760539855; cv=none; b=hYxuaD0ZCPRG2OQo8DGsjIqn7b+b6Cj+8GlThYZAa0E0uxTZa0rblTyos99b2utfvUz02Fha7bvp7k11Onbjf/IKhQ/InLbii/anT4FlzxUN/adpFQ6tJ18C9B9uzUYyBOTf73E7B+5/VQCRhkxr9eKSs2TVHNat3LwLxEhwcXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760539855; c=relaxed/simple;
	bh=l4aPkLm2ht8kNyiQ3N00hcZbTaQ7nehSwJ6B5KBb20I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qPhaugUTf7KCPmwPIPo1/eYvuL9no2EDWoGNyrR4F4l2bqK6ygGU5SS3wHssjb/9Tra+C24TJ3yeUD5KrbYOe95AHYpI7o3LDl79A1rOVFUOYkxm9JvzsrwrOHEoTT9qkQRnuiRr6VFI5MTrANeCZzRLlxbcHBH8acf+LJKp244=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 96688139550;
	Wed, 15 Oct 2025 14:50:44 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id 90DF820026;
	Wed, 15 Oct 2025 14:50:42 +0000 (UTC)
Date: Wed, 15 Oct 2025 10:50:50 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Torvalds
 <torvalds@linuxfoundation.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, users@kernel.org, tools@linux.kernel.org
Subject: Re: [workflows]Re: In defense of Link (was Re: [b4] initial "b4
 dig" to supplant Link: trailers)
Message-ID: <20251015105050.39d14f5a@gandalf.local.home>
In-Reply-To: <CANiq72ka1y0YXysRQtuqnzc0i5FSbrGjKwprrXQpozwDOV3khA@mail.gmail.com>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
	<20251013081536-mutt-send-email-mst@kernel.org>
	<CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
	<CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
	<CANiq72ka1y0YXysRQtuqnzc0i5FSbrGjKwprrXQpozwDOV3khA@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: i9kk6o9dunm1zz9ygqwuikdgs564jhab
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 90DF820026
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+//O2erblUaB5To0M5VzvK9XnqvY7WbHA=
X-HE-Tag: 1760539842-91822
X-HE-Meta: U2FsdGVkX1+df1fvImN41ksuuHRSHdj5NkVA0eu93FH2FFYfO8M0jVSOV7lx48omBwvOhG34uuQJ2/uQFZmrI5RGFrqcIJ7LSeGXrhN5k3YCBb4Dl7TAnA/eZSD8iOYf1eoFILaVao/6B22TmXQec+ClbcbQ8N6SL4zIDh8aHcFGkrKmdpp1qNKFs1OtPhEUQaU+r2CSLNRafvQdk9hTt3ycCfyEup6odwWkJMgwz2nN2tjfiiEIAhj7oXT0PniXDqFJlNa9j/lH7ygTtbfoQIDkexEN+fTE6rroNJZ9HfZoC7cfjaCmEHYlGUMYH1fNvVobPjEhksswP4E1Dkiz7EeczWyWJzS2

On Wed, 15 Oct 2025 11:38:41 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> Yeah, when they are added automatically as a big block (e.g. 10
> lines), it is not great.

I'm guilty of this, as my script adds all those that are Cc'd to a patch to
the commit body. It's used when somebody complains to me they didn't know
about a change, I can go back and say "but you were Cc'd on it".

But thinking about this. If we have a Link: tag to the commit that was
pulled in, that could be used in replace of Cc's. Because, then I can go to
the email patch itself and say "but you were Cc'd on it".

-- Steve
