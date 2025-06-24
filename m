Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527A92D12E0
	for <tools@linux.kernel.org>; Tue, 24 Jun 2025 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775440; cv=none; b=Us7RGgVYJfxjpOqgsDpOr1qJqxTMaupoW0n5td44LWvvMtkQcLltb/G5zt1ew12cUR7KlVQ3vBHrXCcXaKoj4Y6JEL+9P1MSxw1iOWmhbAOTf3jO/09gx94NL9iBS5LTgFO/cEz9TGmcVKVQCJxd4RssSdIfWLaBSua60xcnGnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775440; c=relaxed/simple;
	bh=nD6d1oQU0U6CEQ1PjJb3tKi1fzkMIlIjezBHP9gjyFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CsJQFY/ts9NWeub8zVz4Rgy842ID5eyeN0fOZjdkU3HXVkjDcRRzMY7sV97/vjyvPI36MwO0A40BSV+EhCLssGck4j9QkaBXVf8bGnY818OyF5T2jqMvZqmmdyrCIL9ycAy397QDU5r+XgwPfmgGP44b4jQg1iSKSmUA/b9ZBW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ok6TFyRC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ok6TFyRC"
Received: by smtp.kernel.org (Postfix)
	id DB048C4CEF1; Tue, 24 Jun 2025 14:30:39 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C47FC4CEF4
	for <tools@kernel.org>; Tue, 24 Jun 2025 14:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5C47FC4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-8733548c627so15909839f.3
        for <tools@kernel.org>; Tue, 24 Jun 2025 07:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750775437; x=1751380237; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nD6d1oQU0U6CEQ1PjJb3tKi1fzkMIlIjezBHP9gjyFE=;
        b=ok6TFyRC0+XK1VmGfoj7iGpaieaq9RKJJ8PCHGqROGAnSsPsETTHwn4kV3g3tpUx+Q
         WfBMYwF/viwn+kpGj5Tjiz3fbJh5RQ18b9ep3XuKQjN4MMFL27uVx9IDdiLQqsKO9g0/
         kc7WFSARa5z2p/Dkn8JBWA2p8hMso7jWTK3/2qHqkuwSFPlyjq4RbEcWX4KE8TUBb4VC
         kHMQzUUVgI96ZkI01Q2ZapUvRy0P9ndHSBrxnHmeaKbaBcq7OPwZGSSJmVH9u+B7//lD
         Vp6Rym03RdnfS6VL/su7BRFMy9aAz85J5mt7u87Bouuxg59nABOexhHbmZOVcWhevbcA
         SuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775437; x=1751380237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nD6d1oQU0U6CEQ1PjJb3tKi1fzkMIlIjezBHP9gjyFE=;
        b=UYF7t/EqmfhHTMRJqbIIMLELD1UPzqKTHnlxpmUDBQAgdJJfz038EcpdX/P3OQpMBw
         Xsv0F1JKFUqXC8lBVaMktN4YWt/7By6KbwT4zvFhKdF7QhKYwk+7L+jChyIAsRtVvRd1
         9O5pdVnUKYPq/AQ5kUZTZ6mX9BIb9yWf6v22l35lIk+biP4Z5AjDWxdkLfAbNR0zu/Bw
         Bx4rZhj7ahxPb1CbX5TMKqcziriPe75IcvxatBjzNuKzcoYjbaOmFVC+1kAmgh2m146O
         L4ze3PVHwpZ427RKzT8EHUNL+ellPBHpW4Bx9ZjZF4xzSnCHd4bujVpWHixGqlso61Dy
         hnYg==
X-Forwarded-Encrypted: i=1; AJvYcCWaVXhta1XAAXtF1CMN7EWBrEabT9lXiqPAlTQ7gKesVtDdOq6QGqWhdwGl5xsGAM3xTrbtHg==@kernel.org
X-Gm-Message-State: AOJu0Yx/mv2x76UEe1rEpk/u3RSrjfZUQl4R37T2iskNNa7IyhxzLk0j
	XEwlKQQW6uGeHNCxocv4DYTy8HA+7TNRgfgdTTvn90No9Av3eru1jvGz2dGQH6w2aoeOq+2Nibb
	DDhTzQj/8I08WugUmsRC87N4yTTpqhRNq2lM4uYQv
X-Gm-Gg: ASbGncueNLJSs17VwLMXRJWKb92ec6nWrgjbD1aXoLZbxh/abwzaFVd72Kvf+DphQ+E
	SWcmw1+7vdvjpoYtVTBKDUfxMpC7RLD9KSMbOxX+uWOFdWAhbgfB+AaogIBw3zPi7e982nqSXd/
	2qAS3Es8i5lR9EUyQ4j1T8eroLkkwkIh+FoJTY5CNi89Ofe+UqN/NGySew05YDEEpGzapC3s+n
X-Google-Smtp-Source: AGHT+IEHixcelKr3ZDZkYGsXMHko5Eg4schrz3wOXp27EKQA6K+fy348hW6r2MyxxJ0URo5kPr2rZaqYfCP2unLWoUs=
X-Received: by 2002:a92:ca0e:0:b0:3dd:bfba:ff9c with SMTP id
 e9e14a558f8ab-3de38ca2a44mr177442515ab.11.1750775436923; Tue, 24 Jun 2025
 07:30:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <aFNYQkbEctT6N0Hb@lappy> <20250623132803.26760-1-dvyukov@google.com>
 <aFqw5-PO4MjsEdYU@yuki.lan>
In-Reply-To: <aFqw5-PO4MjsEdYU@yuki.lan>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 24 Jun 2025 16:30:23 +0200
X-Gm-Features: AX0GCFsbVHjLUySg8qRCEV1aKqnjgETI6fmZpybrMY1RcxRtsY4qbFVJBY3VhYg
Message-ID: <CACT4Y+Youc3M0z0U9arrTgyOC1+UKytav4zObhjUXn8-RLThMQ@mail.gmail.com>
Subject: Re: [RFC 00/19] Kernel API Specification Framework
To: Cyril Hrubis <chrubis@suse.cz>
Cc: sashal@kernel.org, kees@kernel.org, elver@google.com, 
	linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, tools@kernel.org, 
	workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 16:05, Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > 6. What's the goal of validation of the input arguments?
> > Kernel code must do this validation anyway, right.
> > Any non-trivial validation is hard, e.g. even for open the validation function
> > for file name would need to have access to flags and check file precense for
> > some flags combinations. That may add significant amount of non-trivial code
> > that duplicates main syscall logic, and that logic may also have bugs and
> > memory leaks.
>
> I was looking at that part and thinking that we could generate (at least
> some) automated conformance tests based on this information. We could
> make sure that invalid parameters are properly rejected. For open(),
> some combinations would be difficuilt to model though, e.g. for
> O_DIRECTORY the pathname is supposed to be a path to a directory and
> also the file descriptor returned has different properties. Also O_CREAT
> requires third parameter and changes which kinds of filepaths are
> invalid. Demultiplexing syscalls like this is going to be difficult to
> get right.
>
> As for testing purposes, most of the time it would be enough just to say
> something as "this parameter is an existing file". If we have this
> information in a machine parseable format we can generate automatic
> tests for various error conditions e.g. ELOOP, EACESS, ENAMETOOLONG,
> ENOENT, ...
>
> For paths we could have something as:
>
> file:existing
> file:notexisting
> file:replaced|nonexisting
> file:nonexisting|existing
> dir:existing
> dir:nonexisting
>
> Then for open() syscall we can do:
>
> flags=O_DIRECTORY path=dir:existing
> flags=O_CREAT path=file:nonexisting|existing
> flags=O_CREAT|O_EXCL path=file:nonexisting
> ...
>
> You may wonder if such kind of tests are useful at all, since quite a
> few of these errors are checked for and generated from a common
> functions. There are at least two cases I can think of. First of all it
> makes sure that errors are stable when particular function/subsystem is
> rewritten. And it can also make sure that errors are consistent across
> different implementation of the same functionality e.g. filesystems. I
> remember that some of the less used FUSE filesystems returned puzzling
> errors in certain corner cases.

I am not following how this is related to the validation part of the
patch series. Can you elaborate?

Generation of such conformance tests would need info about parameter
types and their semantic meaning, not the validation part.
The conformance tests should test that actual syscall checking of
arguments, not the validation added by this framework.


> Maybe it would be more useful to steer this towards a system that
> annotates better the types for the syscall parameters and return values.
> Something that would be an extension to a C types with a description on
> how particular string or integer is interpreted.

+1


> > Side-effects specification potentially can be used to detect logical kernel bugs,
> > e.g. if a syscall does not claim to change fs state, but it does, it's a bug.
> > Though, a more useful check should be failure/concurrency atomicity.
> > Namely, if a syscall claims to not alter state on failure, it shouldn't do so.
> > Concurrency atomicity means linearizability of concurrent syscalls
> > (side-effects match one of 2 possible orders of syscalls).
> > But for these we would need to add additional flags to the descriptions
> > that say that a syscall supports failure/concurrency atomicity.
> >
> > 8. It would be useful to have a mapping of file_operations to actual files in fs.
> > Otherwise the exposed info is not very actionable, since there is no way to understand
> > what actual file/fd the ioctl's can be applied to.
>
> +1 There are many different kinds of file descriptors and they differ
> wildy in what operations they support.
>
> Maybe we would need a subclass for a file descriptor, something as:
>
> fd:file
> fd:timerfd
> fd:pidfs

FWIW syzkaller has this for the purpose of automatic generation of test inputs.
