Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B8036CDED
	for <tools@linux.kernel.org>; Fri, 19 Dec 2025 18:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766168197; cv=none; b=TmMFd18gqnYQIS7bLsOYSNz9V4tBDWXy3SUupTsQhV4wEMJQV3ikCXm5mA3kZRkbOwPu4uH5kfXTGZXfjTSgFOZ2L0hDLwWfvF6ocHF9vWOQH84cjX3LgWL+dzV33Hn/QcLSDMwqpGWzzbElAyKZ/2SOYzp7Yn94KWTtIX9FmEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766168197; c=relaxed/simple;
	bh=8vIjXpgHXtFeRSOqKVMov/hg6meC/DF83ahsMfwvsY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lEek19Ju1dIZkQcgm8lRiu/UmPP673v6XikH05do3LO2JttsyPIomEfWpVqLt21yOZGL4NGbRRH0jmxXNv421iBUTNuRu1TWjS320VXzz2y85vKo98i+j6Dig+VoXSVRLcrMmFIC2Z7f02r8KCwIqp+Tb1PUMsYUg6sQYCaSnjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmkFSU6x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmkFSU6x"
Received: by smtp.kernel.org (Postfix)
	id EA087C4AF0C; Fri, 19 Dec 2025 18:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 480BAC4CEF1;
	Fri, 19 Dec 2025 18:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766168196;
	bh=8vIjXpgHXtFeRSOqKVMov/hg6meC/DF83ahsMfwvsY0=;
	h=From:To:Cc:Subject:Date:From;
	b=CmkFSU6xveRvd5PZ+6XKFMBagTYvDhenJwoXwmElCyMSSuZh7VLq+2qjR0lBbhnzQ
	 pLmTo8GnvmR4sGV0pzG36rSIIajyhFvOLEVBJl1qUYbA5SzXQqFL0XRKzD0B2jjJD4
	 QPGeX+mzKUAj1V2zVis0Sj094o7jRQLJmfLAC6t8nus4I7yClr7nR/N52n98uWTHhW
	 2HupSOUm7BwJE5MDyCp1YkzhIYPsLSXT034RW/KUCgU9nlRiCCiL6WK6I8NQJ2Ff0W
	 mXGIiBj5P8tbd+QcKimZIq+MgCUk5Hq+DToqG4Z9WtJZLP3atfzlqs+kLLUimAM9cM
	 50KygDmpSSagw==
From: Sasha Levin <sashal@kernel.org>
To: tools@kernel.org
Cc: linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org,
	broonie@kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [RFC 0/5] LLMinus: LLM-Assisted Merge Conflict Resolution
Date: Fri, 19 Dec 2025 13:16:24 -0500
Message-ID: <20251219181629.1123823-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At the 2025 Maintainer's Summit, there was discussion around the various hats
Linus wears in the community. One of them being the hat of the one who merges
commits into master and resolves conflicts.

Linus made an interesting observation: he enjoys doing merges in C and has
become exceptionally good at it through decades of experience - he can "do them
in his sleep". But he also observed that merges in Rust are more difficult as
he's not familiar enough with the language. He tries to resolve them himself,
then refers back to linux-next's resolution. When his resolution doesn't match,
he uses it as a teaching moment.

This observation points to something fundamental about merge conflict
resolution: it is the epitome of understanding code. To resolve a conflict, one
must understand why the divergence occurred, what the developers on each side
were trying to accomplish, and then unify the divergence in a way that makes
the final code equal to or better than the sum of both parts.

LLMinus is a tool designed to support a maintainer's decision making around
merge conflict resolution by learning from past merges as well as investigating
into the different branches, trying to understand the underlying reason behind
a conflict.

LLMinus learns from the kernel's git history, extracting cases where manual
conflict resolution was required. For each historical merge, it captures what
each branch changed and how the conflict was resolved.  These resolutions are
converted into semantic embeddings, creating a searchable knowledge base of
past merge patterns.

When a maintainer encounters a conflict, LLMinus finds semantically similar
historical resolutions and constructs a prompt for an LLM that includes the
current conflict, similar past resolutions, and guides the LLM to investigate
thoroughly before attempting resolution.

The "LLMinus pull" command integrates directly with lore.kernel.org:

    LLMinus pull <message-id>

This fetches the pull request email, executes the pull, and - if conflicts
arise - invokes the LLM with full context including any conflict resolution
instructions the submitting maintainer provided.

In the immediate term, I'm hoping to turn LLMinus into a tool that is useful
for Linus Torvalds, Mark Brown, and other maintainers who pull from sub-trees
to help understand and review conflicts and support their decision making.

To support the effort of improving the tool, I plan to use LLMinus in my
linus-next work, auditing every conflict resolution it suggests against what
Linus actually does.  This serves two purposes: using Linus's resolutions to
continuously improve the tooling, and potentially spotting issues in merges
that warrant a second look. I will track divergences and build statistics on
how well the tool performs, ideally reaching parity with Linus in the future.

Another point raised at the summit was the value of linux-next's "fs-next"
branch - filesystem maintainers benefit from having their own integration
branch focused on fs/ issues. Currently, creating similar branches for other
subsystems would overwhelm the linux-next maintainer with additional merge
work. LLMinus could change this equation, enabling more subsystem-specific
integration branches without proportionally increasing human effort.

Here is "LLMinus pull 98b74397-05bc-dbee-cab4-3f40d643eaac@kernel.org" on top
of v6.19-rc1:

    === Fetching Pull Request ===

    Fetching: https://lore.kernel.org/all/98b74397-05bc-dbee-cab4-3f40d643eaac@kernel.org/raw
    Subject: [GIT PULL] RISC-V updates for the v6.19 merge window (part two)
    From: Paul Walmsley <pjw@kernel.org>
    Date: Thu, 11 Dec 2025 19:36:25 -0700 (MST)
    Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.19-mw2

    === Executing Git Pull ===

    Executing: git pull git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.19-mw2
    Auto-merging Documentation/admin-guide/kernel-parameters.txt
    Auto-merging Documentation/devicetree/bindings/riscv/extensions.yaml
    Auto-merging arch/riscv/Kconfig
    Auto-merging arch/riscv/include/asm/hwcap.h
    CONFLICT (content): Merge conflict in arch/riscv/include/asm/hwcap.h
    Auto-merging arch/riscv/include/asm/pgtable.h
    Auto-merging arch/riscv/kernel/cpufeature.c
    Auto-merging include/linux/mm.h
    CONFLICT (content): Merge conflict in include/linux/mm.h
    Auto-merging tools/testing/selftests/riscv/hwprobe/which-cpus.c
    Automatic merge failed; fix conflicts and then commit the result.

    === Merge Conflicts Detected ===

    Found 2 conflict region(s) to resolve
    Looking for similar historical conflicts...
    Found 3 similar historical resolutions


And the resulting merge commit (where one part matches the resolution
instructions, and one part differs):

    Merge tags/riscv-for-linus-6.19-mw2 RISC-V updates for the v6.19 merge window (part two)

    Second set of RISC-V updates for v6.19-rc1

    - Add support for control flow integrity for userspace processes.
      This is based on the standard RISC-V ISA extensions Zicfiss and
      Zicfilp

    - Add probing and userspace reporting support for the standard RISC-V
      ISA extensions Zilsd and Zclsd, which implement load/store dual
      instructions on RV32

    - Abstract the register saving code in setup_sigcontext() so it can be
      used for stateful RISC-V ISA extensions beyond the vector extension

    - Add the SBI extension ID and some initial data structure definitions
      for the RISC-V standard SBI debug trigger extension

    - Clean up some code slightly: change some page table functions to
      avoid atomic operations oinn !SMP and to avoid unnecessary casts to
      atomic_long_t; and use the existing RISCV_FULL_BARRIER macro in
      place of some open-coded "fence rw,rw" instructions

    Merge conflict resolution:

    # Merge Conflict Resolution: riscv-for-linus-6.19-mw2

    ## Summary

    This merge integrates RISC-V CFI (Control Flow Integrity) support for userspace
    processes along with additional ISA extension probing support. The resolution
    followed the maintainer's guidance from Paul Walmsley's pull request email.

    ## Conflicts Resolved

    ### 1. arch/riscv/include/asm/hwcap.h - ISA Extension ID Renumbering

    **Conflict:** Both branches added new RISC-V ISA extensions with overlapping IDs.
    - HEAD added SVRSW60T59B at 100 and ZALASR at 101
    - MERGE_HEAD added ZALASR at 100, plus ZILSD, ZCLSD, ZICFILP, ZICFISS for CFI

    **Resolution:** Kept all extensions with renumbered IDs to avoid duplicates:
    - SVRSW60T59B: 100 (from HEAD)
    - ZALASR: 101 (bumped from 100)
    - ZILSD: 102 (bumped from 101)
    - ZCLSD: 103 (bumped from 102)
    - ZICFILP: 104 (bumped from 103)
    - ZICFISS: 105 (bumped from 104)

    As the maintainer noted, the exact numbers are not important - they just need
    to be unique and below RISCV_ISA_EXT_MAX (128).

    ### 2. include/linux/mm.h - VM_SHADOW_STACK for RISC-V CFI

    **Conflict:** The VMA flags code was significantly refactored by commit
    9ea35a25d51b ("mm: introduce VMA flags bitmap type"). The incoming RISC-V
    CFI changes used the old-style #define syntax which conflicted with the
    new enum-based DECLARE_VMA_BIT_ALIAS approach.

    **Resolution:** Following the maintainer's guidance:

    a) In the enum section (line 362), added RISC-V CFI to the x86 shadow stack
       condition to share the same bit alias:
       ```c
       #if defined(CONFIG_X86_USER_SHADOW_STACK) || defined(CONFIG_RISCV_USER_CFI)
       ```

    b) In the VM_SHADOW_STACK macro definition (line 463-464), added RISC-V CFI
       to enable the flag:
       ```c
       #if defined(CONFIG_X86_USER_SHADOW_STACK) || defined(CONFIG_ARM64_GCS) || \
           defined(CONFIG_RISCV_USER_CFI)
       ```

    This follows the same pattern used for x86 and ARM64 shadow stacks, where
    x86 and RISC-V share HIGH_ARCH_5 (bit 37) and ARM64 GCS uses HIGH_ARCH_6.

    ## Rationale

    The resolution is cleaner than the maintainer's suggested diff because it:
    1. Properly integrates with the new VMA flags enum system
    2. Maintains consistency with how x86 and ARM64 shadow stacks are handled
    3. Doesn't leave any remnants of the old-style macros

    ## Testing Considerations

    - RISC-V CFI requires the Zicfiss and Zicfilp ISA extensions
    - The Kconfig prevents enabling CFI on no-MMU systems for bisectability
    - Full testing should include both hardware emulation and QEMU

    Link: https://lore.kernel.org/all/98b74397-05bc-dbee-cab4-3f40d643eaac@kernel.org/

The tool is available in tools/LLMinus and can be built with:

    cd tools/llminus && cargo build --release

Few notes:

 - My Rust knowledge is questionable, and a lot of the code was written with
   the help of an LLM. It's best if we don't dig too deep into actual code
   review at this point and focus on the concept itself.

 - The tool will work with any LLM that can take a prompt via stdin, but will
   work even better with tools that allow the LLM to run other tools as part of
   it's investigative work.

 - There's no GPU support just yet, so creating the embeddings for the entire
   history takes quite a while...

Sasha Levin (5):
  LLMinus: Add skeleton project with learn command
  LLMinus: Add vectorize command with fastembed
  LLMinus: Add find command for similarity search
  LLMinus: Add resolve command for LLM-assisted conflict resolution
  LLMinus: Add pull command for LLM-assisted kernel pull request merging

 tools/llminus/.gitignore  |    1 +
 tools/llminus/Cargo.toml  |   20 +
 tools/llminus/src/main.rs | 2289 +++++++++++++++++++++++++++++++++++++
 3 files changed, 2310 insertions(+)
 create mode 100644 tools/llminus/.gitignore
 create mode 100644 tools/llminus/Cargo.toml
 create mode 100644 tools/llminus/src/main.rs

-- 
2.51.0

