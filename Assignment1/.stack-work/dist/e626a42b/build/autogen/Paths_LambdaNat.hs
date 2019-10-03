{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_LambdaNat (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Charlie Story\\Documents\\GitHub\\LambdaNat5\\Assignment1\\.stack-work\\install\\f33caf5a\\bin"
libdir     = "C:\\Users\\Charlie Story\\Documents\\GitHub\\LambdaNat5\\Assignment1\\.stack-work\\install\\f33caf5a\\lib\\x86_64-windows-ghc-8.6.4\\LambdaNat-0.1.0.0-2kfAZLS9jVXK0OvNqCZE1W"
dynlibdir  = "C:\\Users\\Charlie Story\\Documents\\GitHub\\LambdaNat5\\Assignment1\\.stack-work\\install\\f33caf5a\\lib\\x86_64-windows-ghc-8.6.4"
datadir    = "C:\\Users\\Charlie Story\\Documents\\GitHub\\LambdaNat5\\Assignment1\\.stack-work\\install\\f33caf5a\\share\\x86_64-windows-ghc-8.6.4\\LambdaNat-0.1.0.0"
libexecdir = "C:\\Users\\Charlie Story\\Documents\\GitHub\\LambdaNat5\\Assignment1\\.stack-work\\install\\f33caf5a\\libexec\\x86_64-windows-ghc-8.6.4\\LambdaNat-0.1.0.0"
sysconfdir = "C:\\Users\\Charlie Story\\Documents\\GitHub\\LambdaNat5\\Assignment1\\.stack-work\\install\\f33caf5a\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "LambdaNat_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "LambdaNat_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "LambdaNat_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "LambdaNat_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "LambdaNat_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "LambdaNat_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
