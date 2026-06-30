Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6193E95BD
	for <tools@linux.kernel.org>; Tue, 30 Jun 2026 09:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811686; cv=none; b=gc92NjG1sBXZf/NvkR0HgeZQJTRFUcvO/rumgCe2Os4Y8uUycV5/UtA3zTd5YJrnn2pJASFwEvD76XT1Z5S8rxPxkcdPFoxNh2PcDx0DXV9eTqQ0ecL17SSXtQQNc1svPhTZ64i7bfAiWKlCj+Uz7J+j+0ZiMaKs0rMELRvG1KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811686; c=relaxed/simple;
	bh=5xnCk0bYFwTmMjm2S7Qf0Rs2qn0B5fhUTr77SbT8Svk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=nukMsfGUrqkIjBOFXEMVLY5qYNvvybtSwtNICfq/ovyhvFM5Ta0nyP0DNySTMlmyOT3byZMbXB4qs/CiKvZbAY5zXv6Ry0PoDNVFKiqq9MT8qqTfN6pFvecrz9aeK3RDe22Bl/ee7LT16DG+tQjgIXItrnjmKC7pXzwh6Fa6Whg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j13pNp+G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j13pNp+G"
Received: by smtp.kernel.org (Postfix)
	id CDC611F00AC4; Tue, 30 Jun 2026 09:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374C41F000E9;
	Tue, 30 Jun 2026 09:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782811684;
	bh=PSXiGWpGmWy+Yh9vRXpTKKZHv/q/Dvge0DDUTpLR8qA=;
	h=Date:From:Subject:To:Cc;
	b=j13pNp+GMavm4AG/HrZ+2UFbP1qG9OnGRpf+XfVxvuuVF1WUkUoUdEs5cXkvDeZiq
	 IqTskoxis3MZ5gTKiPxdzxbmdWgtQlkCwmYh17M+9MuRB0gV6J65PQ7cP+2S8Z/qIL
	 0c098Hkq0sZJZSbXWX9WFkmkSIRBkIZG3NW7qJJ8LUKbnRi/7XZ8hdfULvexv7+6X6
	 yH6H9JCtgasL3CKgBdlSZCexcv8mniszQxiowMQ8/mB/Dr8s/2MpKa+Di1JNXzmIZ5
	 4eYU9U4oYLKltJ93gWACmbjzXBnDtP3Hw6ADFu2ng5hfeB5Ss4kavjUfIoAlmc7NcJ
	 +Oh/IBul+iIeA==
Message-ID: <db20312a-5846-4d32-8913-f3265bfe5f93@kernel.org>
Date: Tue, 30 Jun 2026 11:28:01 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Matthieu Baerts <matttbe@kernel.org>
Content-Language: fr
Subject: b4 review: please update the requirements files
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Konstantin,

Thank you for having updated b4 review!

Today, I tried to use 'b4 review tui', latest dev version -- 4217c3e
("plan: normalize body text to valid vim-outliner markup") -- but I got
a few crashes, e.g. the following one when using the 'Update all'
"button":

---------------------------- 8< ----------------------------
/src/b4/src/b4/review_tui/_modals.py:2781 in on_mount

  2778 │   │   │   )
  2779 │
  2780 │   def on_mount(self) -> None:
❱ 2781 │   │   run_lore_worker(self, self._do_updates, name='_do_updates')
  2782 │
  2783 │   def action_cancel(self) -> None:
  2784 │   │   self._cancelled = True

╭───────── locals ─────────╮
│ self = UpdateAllScreen() │
╰──────────────────────────╯

/src/b4/src/b4/review_tui/_common.py:266 in run_lore_worker

   263 │     ``WorkerFailed`` (``exit_on_error=False``), so it surfaces through the
   264 │     host's ``on_worker_state_changed`` handler instead.
   265 │   """
❱  266 │   with lore_request():
   267 │   │   return host.run_worker(
   268 │   │   │   work, name=name, thread=True, exit_on_error=exit_on_error, **kwargs
   269 │   │   )

╭──────────────────────────────────── locals ─────────────────────────────────────╮
│ exit_on_error = False                                                           │
│          host = UpdateAllScreen()                                               │
│        kwargs = {}                                                              │
│          name = '_do_updates'                                                   │
│          work = <bound method UpdateAllScreen._do_updates of UpdateAllScreen()> │
╰─────────────────────────────────────────────────────────────────────────────────╯

/usr/lib/python3.14/contextlib.py:141 in __enter__

  138 │   │   # they are only needed for recreation, which is not possible anymore
  139 │   │   del self.args, self.kwds, self.func
  140 │   │   try:
❱ 141 │   │   │   return next(self.gen)
  142 │   │   except StopIteration:
  143 │   │   │   raise RuntimeError("generator didn't yield") from None
  144

╭─────────────────────────────── locals ────────────────────────────────╮
│ self = <contextlib._GeneratorContextManager object at 0x7e55b9903230> │
╰───────────────────────────────────────────────────────────────────────╯

/src/b4/src/b4/review_tui/_common.py:238 in lore_request

   235 │   left behind by a prior aborted operation.  Use it directly around a
   236 │   synchronous fetch, or via :func:`run_lore_worker` for a threaded one.
   237 │   """
❱  238 │   b4.get_lore_node().reset_cancel()
   239 │   yield
   240
   241

AttributeError: 'LoreNode' object has no attribute 'reset_cancel'
---------------------------- 8< ----------------------------

Note that I also had a crash with the 'update' and 'review' "buttons".

I initially thought that it was because my tracked list contains patches
from the end of April, and that's why I first tried to "clean" my
environment by renaming ~/.cache/b4, ~/.local/share/b4 and ~/.local/
hare/b4-archived directory. But I still had patches in the list. I
finally fixed the issue by updating the requirements files, but first:
how do I reset b4 review?

When you have a chance, could you please update these requirements
files? I guess you prefer to apply the modifications generated by 'uv'
yourself.

(While at it, it might be good to have batch actions on the tracked list
view as well :) )

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.
