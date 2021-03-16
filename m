Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA47259F
	for <tools@linux.kernel.org>; Tue, 16 Mar 2021 21:51:30 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kyleam.com; s=key1;
	t=1615931021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S2hs1YwvdjZF6rPPDGcdvz8i3SxqjDUVR1qi+R3tYDE=;
	b=I0maEY7yZVzpe+99njtQgvyRYIP49gUR/5wr30K/nGQOK7cOVNluIMzM+LEBGl07JSEsmV
	bg88T6lPntcJoRJR3sIJZD2/abcaR2CSYjNjSPxfKF3JWdZRLsJqFl9V/FUfkYHm+8XHz1
	7I3JJcr7SHEh/238BX4k8ZapNmzJt3s98TECLfdDThxPRAHshDNqiZdDxIWhnAWdM9Bh7n
	wR1skKca8H3DlJnOLurjXzoemZ60ibcxfgsmOUkg5UQfaShlyAWcwjsj8I/Jn7rW+QikHm
	7A9Z6kRKZgNCZ+EZOgm3OEPWUf0AISFRAqv8JkWnK7VxZTtrkiobuDOXRoOAGA==
From: Kyle Meyer <kyle@kyleam.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: tools@linux.kernel.org
Subject: Re: [REQ] b4: Allow -m from stdin
In-Reply-To: <YFETLu8TKWI2WlSF@hirez.programming.kicks-ass.net>
References: <YFETLu8TKWI2WlSF@hirez.programming.kicks-ass.net>
Date: Tue, 16 Mar 2021 17:43:39 -0400
Message-ID: <87mtv2srjo.fsf@kyleam.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: kyle@kyleam.com

Peter Zijlstra writes:

> The use case is pipeing a whole thread into it from mutt without it
> having to access the web (which might not be available etc..).

Sidenote: I think operating offline with --use-local-mbox would require
something like the patch at
<https://lore.kernel.org/tools/20210208040722.31203-1-kyle@kyleam.com>.

