Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438A82914
	for <tools@linux.kernel.org>; Fri,  2 Sep 2022 19:16:25 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id f14so2542919qkm.0
        for <tools@linux.kernel.org>; Fri, 02 Sep 2022 12:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:to:from:date:from:to:cc:subject:date;
        bh=+fTxEu+9raGodoRYRixRI0BJEalOOgquH7GmlHGNErQ=;
        b=FhMaZBGlb6mJPj9cq7vESnws93mU8IqfjUt48l/1MoEzS0jfkzh9I1BOMNPqnV4r5o
         ZYfK1Y4D9+blj7vV7pieqq5uKa/NbSXYHmgZvuB1CfxOwQS/FQ/YwevtjhdbqQAHKXIK
         I7H4BbAozxup6hOzBH9FawdTE3TPe6egUWvcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+fTxEu+9raGodoRYRixRI0BJEalOOgquH7GmlHGNErQ=;
        b=cy/VeP4GqPkBmygft33KNORLQGXqHOe/EEzxdxKWOIlcLjUrsmPaLFMMiXY5olg8cp
         YXmWD1/TvuYjBzGeew/gAjK9M+VJyWg9ZrUAO7rJL5sLFNk5zrMqUoTBQjTco9xbAss1
         kCsFH+VGFLmCZT9GXoRHpYeIopBjEmQrx3DXui6G56koMQ2XanCzw+/9cATqEkXby3nU
         bK68GWb2eaqhpSTN/g0vTmiPCgHfkDsU1v8KZxPnEcBPJt8AdN8E6N+U9DjnnhkLkXTN
         kXzNQFKkPGp8kuX9Rgfj4dXM/VbtCEMQ9xtHvfOrjydyXLlaTWs/H/uCZDIyLka0HdEC
         jnMA==
X-Gm-Message-State: ACgBeo3Tu5fwswPID3CpZyIROIhaJOzFLcvYyDFyyxp9EHqKCx1P2OZI
	CBMqKE8PhhawiDwTCjJKnRVw6gUg+A5fyA==
X-Google-Smtp-Source: AA6agR6pQd7twj/baoMQ13CcmvZ59Df4pEDsFecNhXiMThNA0myfU64/akNDEn+N0w4/xd9ygykNng==
X-Received: by 2002:a05:620a:1a09:b0:6c0:900d:1609 with SMTP id bk9-20020a05620a1a0900b006c0900d1609mr8856442qkb.42.1662146183862;
        Fri, 02 Sep 2022 12:16:23 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id i1-20020a05620a248100b006b8e63dfffbsm1992758qkn.58.2022.09.02.12.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 12:16:23 -0700 (PDT)
Date: Fri, 2 Sep 2022 15:16:22 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: users@linux.kernel.org, tools@linux.kernel.org
Subject: b4 further beta testing (now with a web submission endpoint)
Message-ID: <20220902191622.rrcbq2obitnumfdb@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi, all:

The work on b4 send continues and I feel things are getting close to the point
where it can be reasonably used in day-to-day work. Special thanks to everyone
who trialled this out in the past few weeks despite high chance of things
spontaneously exploding.

Here's the latest, if you're interested in trying things again:

b4 prep: preparing your series for submission
---------------------------------------------

- You can now convert any previously sent series into a prep-managed branch
  using the -F flag. Here's an example with a random series from lkml:

	$ b4 prep -F 20220830233129.30610-1-samitolvanen@google.com
	Grabbing thread from lore.kernel.org/all/20220830233129.30610-1-samitolvanen%40google.com/t.mbox.gz
	Checking attestation on all messages, may take a moment...
	---
	  ✓ [PATCH v4 1/21] treewide: Filter out CC_FLAGS_CFI
	  ✓ [PATCH v4 2/21] scripts/kallsyms: Ignore __kcfi_typeid_
	  [...]
	  ✓ [PATCH v4 20/21] x86/purgatory: Disable CFI
	  ✓ [PATCH v4 21/21] x86: Add support for CONFIG_CFI_CLANG
	  ---
	  ✓ Signed: openpgp/samitolvanen@google.com
	  ✓ Signed: DKIM/google.com
	---
	Created new branch b4/kcfi_support
	Applying 21 patches
	---
	Applying: treewide: Filter out CC_FLAGS_CFI
	Applying: scripts/kallsyms: Ignore __kcfi_typeid_
	[...]
	Applying: x86/purgatory: Disable CFI
	Applying: x86: Add support for CONFIG_CFI_CLANG
	---
	NOTE: any follow-up trailers were ignored; apply them with b4 trailers -u

   You can now run "b4 prep --edit-cover" to modify the cover letter, and
   you can run "b4 trailers -u" to grab the latest trailers updates without
   having to remember the msgid of the thread:

	$ b4 trailers -u
	Calculating patch-ids from 21 commits
	Checking change-id "20220902-kcfi_support-5bb769dfacb5"
	Grabbing search results from lore.kernel.org
	Nothing matching that query.
	Retrieving thread matching 20220830233129.30610-1-samitolvanen@google.com
	Grabbing thread from lore.kernel.org/all/20220830233129.30610-1-samitolvanen%40google.com/t.mbox.gz
	---
	  treewide: Filter out CC_FLAGS_CFI
		+ Tested-by: Nathan Chancellor <nathan@kernel.org> (✓ DKIM/kernel.org)
		+ Tested-by: Kees Cook <keescook@chromium.org> (✓ DKIM/chromium.org)
	
	  [...]
	
	  x86: Add support for CONFIG_CFI_CLANG
		+ Reviewed-by: Kees Cook <keescook@chromium.org> (✓ DKIM/chromium.org)
		+ Tested-by: Nathan Chancellor <nathan@kernel.org> (✓ DKIM/kernel.org)
		+ Tested-by: Kees Cook <keescook@chromium.org> (✓ DKIM/chromium.org)
	---
	Invoking git-filter-repo to update trailers.
	New history written in 1.15 seconds...
	Completely finished after 1.46 seconds.
	Trailers updated.

b4 trailers: automatically apply latest received trailers
---------------------------------------------------------
The "b4 trailers" command is now hopefully better behaved.

- the --signoff switch is gone, as your own commits should already have your
  DCO trailer
- any newly received trailers should automatically be inserted above your own
  Signed-off-by
- the trailer-order config option will only apply to your own section in the
  trailers, to respect the chain of custody order, e.g.:

	Fixes: abcde (Commit info)
	Suggested-by: Rep Orter <rep.orter@exmple.com>
	Signed-off-by: Dev Eloper <dev.eloper@example.com>
	--> start of your own custody section
	Link: https://msgid.link/some@thing.foo
	Acked-by: Collected Trailer 1 <collected1@example.com>
	Reviewed-by: Collected Trailer 2 <collected2@example.com>
	Tested-by: Collected Trailer 3 <collected3@example.com>
	Signed-off-by: Your Name <your.name@example.com>
	--> end of your own custody section

b4 send: now with web-endpoint support
--------------------------------------
"b4 send" saw the most changes and supports the web submission endpoint. The
goal behind this is to make it easier for developers without access to sanely
configured SMTP servers to submit valid patch series. Here's how it works:

1. You need to have a valid PGP key (or a valid patatt key). The PGP key
   doesn't need to be in any web of trust, it just needs to be valid and set
   up in git as user.signingkey.

2. Add b4.send-endpoint-web to ~/.gitconfig (or .git/config to only enable
   this for a specific project). E.g.:

	[user]
      name = Dev Eloper
      email = dev.eloper@example.com
	  signingkey = ABCDBCDECDEF0123

	[b4]
	  send-endpoint-web = https://lkml.kernel.org/_b4_submit

3. Next, enroll with the endpoint:

	$ b4 send --web-auth-new

   This generates a unique challenge that is sent to the user.email address.

4. Once you receive the verification email, run the verify command:

	$ b4 send --web-auth-verify [received-uuid-here]

5. Once this completes, you will be able to send patches via "b4 send" 

LIMITATIONS:

1. You can only send patches and cover letters via this service, and one of
   the to/cc addresses must be a mailing list service that we recognize. Any
   code-review or other discussions need to continue to happen via your own
   email client.

2. If your From: is not @kernel.org, @linux.dev, or @linuxfoundation.org, then
   we will do the necessary From: munging in order to pass DMARC checks on the
   receiving end:

   - From: becomes "From: Your Name via B4 Web Endpoing <devnull@kernel.org>"
   - We add "X-Original-From: Your Name <your-actual@address.com>"
   - We add "Reply-To: Your Name <your-actual@address.com>"
   - We add "From: Your Name <your-actual@address.com>" to the message body,
     if it doesn't already have another From: (for git "Author" purposes)

   However, we will write the original version of the email to the
   public-inbox list, so that if someone runs "b4 am/shazam" on your
   submission, they will retrieve the unmodified originals without this
   munging.

b4 send: versioned tagging and --resend
---------------------------------------
After your do a successful "b4 send", the following happens:

- We do some detached HEAD magic to apply your just-sent commits and tag the
  tip with the cover letter contents. E.g. if your branch is called
  b4/documentation-changes, we will create an annotated tag
  "sent/documentation-changes-v1"
- We auto-increment the tracked version and record the message-id of sent
  series
- We auto-edit the cover letter to create the changelog section with 
  "Changes in vN:" entries, pre-populated with the link to the series you just
  sent.

If you want to resend a previously sent series, you can just run 
"b4 send --resend v1", which will use the tag we created during "b4 send" to
repopulate the series and the cover letter.

Updating to the latest b4 dev
----------------------------
To update to the latest b4 dev, you need to run it from the git checkout,
which is described in the README:
https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/README.rst

Reporting bugs
--------------
Please expect bugs and report them to tools@linux.kernel.org. I greatly
appreciate your help getting these new features ready before we open this up
to a larger set of people.

Best regards,
Konstantin
