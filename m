Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6D0209F56
	for <tools@linux.kernel.org>; Fri, 27 Jun 2025 06:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751005436; cv=none; b=P5X9dFRLf1Vibg/kH5CILmUnKCbSgyaQSqXPxGl4mCw+rXDKky0pgl0HWyBm2tnvxoJ/0zS1irrTZt5E0ZB5p2znI3f7EJt4u+VBh19IRWxqeI2OaVTLFbYLk/JogeM4FFcYf3g26nY3IKR3nmE1ahQjK8MAUjXdgZ1DnMsdjSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751005436; c=relaxed/simple;
	bh=JnvY3RTmBx6MRqAVlV09eZbQ7sUKQlL0Z57F3QhInhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E3e7e+02fW2TwSRfjTu4bGk4rsv+Oz7UgRZDstFeOvLCLUU06hlUDgi+haH+Oy1x/L73SXXDNay8mwfY23VCI6jDkiEe8g6IFhSBrsJStvmKNj+ZaLGbPnOZK36pC0DpXUQcg1CeoKXP2iuRrQKpg8VbwyNg5EO+0/kaXLMeINY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2oqaF0u0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2oqaF0u0"
Received: by smtp.kernel.org (Postfix)
	id 2EE62C4CEEF; Fri, 27 Jun 2025 06:23:56 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30716C4CEE3
	for <tools@kernel.org>; Fri, 27 Jun 2025 06:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 30716C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32adebb15c5so13250631fa.3
        for <tools@kernel.org>; Thu, 26 Jun 2025 23:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751005433; x=1751610233; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FRG6NNG0VVS1jQpfAYOrqcRu7QV8DTB5ZsV0Je+hvWM=;
        b=2oqaF0u06RsYtwuovSiIPJbAtJMhFZtqX2xicchJCfmuWhzpxkuD7mK36/cjWF0Dw+
         Jx/agbD/hTBOcqCdSS1THL9kh6NSuO2qSh4BR3rpoheHvtyugrCfGOs9tx3FMzpOAI7h
         h2LIZHF0G2EEDvvHrLfBN9wpVORddulMAj9HYRd96HVz7AIhrpMrFQP3dcmwxIjgmP0Y
         /WrsCw0uHpOmCnYeRxd4XWL1Nl8pX9n1sRF6lO+e1tQaqDz9Rb4gsTIhNyHvCdZp7A6W
         3mTIIpKI1YZ4hjoAlJJkorhYZtgYwBHOugou4jqRTCCUhBsQCjYeWaxn6XFwrfv0WEdA
         kTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751005433; x=1751610233;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FRG6NNG0VVS1jQpfAYOrqcRu7QV8DTB5ZsV0Je+hvWM=;
        b=vuCq/GPnFa3OeBimz3XLLfvyFAgLR0/264uGRhKN5wz1FTRIJH9+ZeiWHIvbWkV6Bd
         Fz0opX+eGNEU/yqfPHWP2eUi5fyIvHLlDjBA/KkoaG7PWjzO+gdtXHX4conC58wrxhC0
         oOuS7ZPaopOVKDQeqco3FVgQhQXs+MjHU8lxKdf3I8bBF49qwWxo9dsEIB1NEEoU7f3o
         5O+IvAMcpJNxASKpAt5FywMwjLVDlQGNdmNBM/QFm6lcPUqxO6yIylslZfEh9MCSMHoA
         +gPXSFAVF1+cX+/mVdNWdTRsSuSzloySLLgszvTL3OBs/XvZdN7evQm6rhXs4MSv9J6a
         S9ag==
X-Forwarded-Encrypted: i=1; AJvYcCWl8+24EvEaWRLsepOT1KB7UtkDdvwA5/x3ZVqr0jzZL5MtGRCPTkryLtYbdMO+IxVbmHxjxA==@kernel.org
X-Gm-Message-State: AOJu0YxfONvuovqQdUzA+MS2RLzb8DNqRXPxKxtsurHZSVw0aONRGs9E
	Fba0793/X3fr3SLwp9AdlBjngPOtumJvY4RUctM7EOdRqiTwesj8NmVJRSstv74pf6gpYAXpwhr
	n5oJZ6a+e7AubaZraT/vWBevq1/fu04YtsqlOP3sW
X-Gm-Gg: ASbGncvyPlpI+ZIB3QInQ38G0OAKmvQhTMrmaKku8JIVNO+tTbdePXIMYu0pVKjdxid
	Or2UzjzwtnbRVzeGZVCUl6KUkim0CJMqiygjDy7ys6AiGHLO/E0aZSg4X0QfyQc0eBkwJV617En
	l8bPHVIqCbfkmP9FQSWy1aHWb/Q5m5KLEbMfAfq+fpInBDqsDiEznkObMv4W6esvr1t9gm7JfP9
	lZW
X-Google-Smtp-Source: AGHT+IGK26L0oF+ODv4+XuY/ZlAuNolDiZF/FXqYhLEt198LoohKc+0K2UtZS/2z5j494oWFlLA35IH14x7tPXsm0Fk=
X-Received: by 2002:a05:651c:20c2:b0:32c:a006:2a36 with SMTP id
 38308e7fff4ca-32cdc524859mr3524071fa.20.1751005432932; Thu, 26 Jun 2025
 23:23:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <aFNYQkbEctT6N0Hb@lappy> <20250623132803.26760-1-dvyukov@google.com>
 <aFsE0ogdbKupvt7o@lappy> <CACT4Y+Y04JC359J3DnLzLzhMRPNLem11oj+u04GoEazhpmzWTw@mail.gmail.com>
 <aFwb_3EE2VMEV_tf@lappy> <CACT4Y+b9u6_wx9BU0hH0L6ogGKN_+R5T7OsgJVFAWm8yeD0E7Q@mail.gmail.com>
 <CACT4Y+b1Sou9bzhsuJ_LAjwCtynWN1iNRnaUkkTecNWxLUfMUw@mail.gmail.com> <aF10Cu0GI092Sjr3@lappy>
In-Reply-To: <aF10Cu0GI092Sjr3@lappy>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 27 Jun 2025 08:23:41 +0200
X-Gm-Features: Ac12FXyAYSKfz7cidEHmKYezvS3_pE2Q0zztohcM72AP4oIRG48UsLnRi3saK5Y
Message-ID: <CACT4Y+ZB45ovD0hX3xX_yTUVSRDc1UCXnVDB57jxyWPPc7k=MA@mail.gmail.com>
Subject: Re: [RFC 00/19] Kernel API Specification Framework
To: Sasha Levin <sashal@kernel.org>
Cc: kees@kernel.org, elver@google.com, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tools@kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Jun 2025 at 18:23, Sasha Levin <sashal@kernel.org> wrote:
>
> On Thu, Jun 26, 2025 at 10:37:33AM +0200, Dmitry Vyukov wrote:
> >On Thu, 26 Jun 2025 at 10:32, Dmitry Vyukov <dvyukov@google.com> wrote:
> >>
> >> On Wed, 25 Jun 2025 at 17:55, Sasha Levin <sashal@kernel.org> wrote:
> >> >
> >> > On Wed, Jun 25, 2025 at 10:52:46AM +0200, Dmitry Vyukov wrote:
> >> > >On Tue, 24 Jun 2025 at 22:04, Sasha Levin <sashal@kernel.org> wrote:
> >> > >
> >> > >> >6. What's the goal of validation of the input arguments?
> >> > >> >Kernel code must do this validation anyway, right.
> >> > >> >Any non-trivial validation is hard, e.g. even for open the validation function
> >> > >> >for file name would need to have access to flags and check file precense for
> >> > >> >some flags combinations. That may add significant amount of non-trivial code
> >> > >> >that duplicates main syscall logic, and that logic may also have bugs and
> >> > >> >memory leaks.
> >> > >>
> >> > >> Mostly to catch divergence from the spec: think of a scenario where
> >> > >> someone added a new param/flag/etc but forgot to update the spec - this
> >> > >> will help catch it.
> >> > >
> >> > >How exactly is this supposed to work?
> >> > >Even if we run with a unit test suite, a test suite may include some
> >> > >incorrect inputs to check for error conditions. The framework will
> >> > >report violations on these incorrect inputs. These are not bugs in the
> >> > >API specifications, nor in the test suite (read false positives).
> >> >
> >> > Right now it would be something along the lines of the test checking for
> >> > an expected failure message in dmesg, something along the lines of:
> >> >
> >> >         https://github.com/linux-test-project/ltp/blob/0c99c7915f029d32de893b15b0a213ff3de210af/testcases/commands/sysctl/sysctl02.sh#L67
> >> >
> >> > I'm not opposed to coming up with a better story...
> >
> >If the goal of validation is just indirectly validating correctness of
> >the specification itself, then I would look for other ways of
> >validating correctness of the spec.
> >Either removing duplication between specification and actual code
> >(i.e. generating it from SYSCALL_DEFINE, or the other way around) ,
> >then spec is correct by construction. Or, cross-validating it with
> >info automatically extracted from the source (using
> >clang/dwarf/pahole).
> >This would be more scalable (O(1) work, rather than thousands more
> >manually written tests).
> >
> >> Oh, you mean special tests for this framework (rather than existing tests).
> >> I don't think this is going to work in practice. Besides writing all
> >> these specifications, we will also need to write dozens of tests per
> >> each specification (e.g. for each fd arg one needs at least 3 tests:
> >> -1, valid fd, inclid fd; an enum may need 5 various inputs of
> >> something; let alone netlink specifications).
>
> I didn't mean just for the framework: being able to specify the APIs in
> machine readable format will enable us to automatically generate
> exhaustive tests for each such API.
>
> I've been playing with the kapi tool (see last patch) which already
> supports different formatters. Right now it outputs human readable
> output, but I have proof-of-concept code that outputs testcases for
> specced APIs.
>
> The dream here is to be able to automatically generate
> hundreds/thousands of tests for each API in an automated fashion, and
> verify the results with:
>
> 1. Simply checking expected return value.
>
> 2. Checking that the actual action happened (i.e. we called close(fd),
> verify that `fd` is really closed).
>
> 3. Check for side effects (i.e. close(fd) isn't supposed to allocate
> memory - verify that it didn't allocate memory).
>
> 4. Code coverage: our tests are supposed to cover 100% of the code in
> that APIs call chain, do we have code that didn't run (missing/incorrect
> specs).


This is all good. I was asking the argument verification part of the
framework. Is it required for any of this? How?
